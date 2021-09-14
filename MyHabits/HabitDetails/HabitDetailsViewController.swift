
import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit? {
        didSet {
            navigationItem.title = habit?.name
        }
    }
    let tableView = UITableView(frame: .zero, style: .grouped)
    let cellIDHabits = "CellIDHabits"
    let allDates = HabitsStore.shared.dates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpTableView()
        //            setUpConstrains()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData1()
    }
    func reloadData1() {
        navigationItem.title = habit?.name
        
    }
    func setUpView() {
        view.backgroundColor = UIColor.MyTheme.myWhite
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = habit?.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.MyTheme.myPurple
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.MyTheme.myPurple
    }
    
    @objc func editTapped() {
        let vc = EditHabitViewController()
        vc.habit = habit
        vc.deleteHandler = {
            if let index = HabitsStore.shared.habits.firstIndex(where: { $0 === self.habit}) {
                HabitsStore.shared.habits.remove(at: index)
                self.dismiss(animated: true) {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        vc.modalPresentationStyle = .fullScreen
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true, completion: nil)
        
    }
    
    @objc func tappedCanceled() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        view.backgroundColor = UIColor.MyTheme.myWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(HabitDetailsTableViewCell.self, forCellReuseIdentifier: cellIDHabits)
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = allDates.count
        return section
    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDHabits) as! HabitDetailsTableViewCell
    //        let date =  HabitsStore.shared.trackDateString(forIndex: allDates.count - 1 - indexPath.item)
    //        cell.habitDateActivityLabel.text = date
    //
    //        if HabitsStore.shared.habit(habit!, isTrackedIn: allDates.first!) == true {
    //            cell.accessoryType = .checkmark
    //        }
    //        return cell
    //    }
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDHabits, for: indexPath)
        
        let datesTracked = HabitsStore.shared.dates.count - indexPath.item - 1
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: datesTracked)
        cell.tintColor = UIColor.MyTheme.myPurple
        
        let selectedHabit = self.habit!
        let date = HabitsStore.shared.dates[datesTracked]
        if HabitsStore.shared.habit(selectedHabit, isTrackedIn: date) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = "Активность"
        return header
    }
}




