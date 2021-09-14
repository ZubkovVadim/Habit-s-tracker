

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: cellIDHabits)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: cellIDProgress)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let cellIDHabits = "CellIDHabits"
    let cellIDProgress = "CellIDProgress"
    let allHabits = HabitsStore.shared
    let allProgress = HabitsStore.shared.todayProgress
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func setUpCollectionView () {
        view.addSubview(collectionView)
        self.navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor =  UIColor.lightGray
        view.backgroundColor = UIColor.lightGray
        collectionView.backgroundColor = UIColor.lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"plus"), style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.MyTheme.myPurple
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.frame = CGRect(x: view.safeAreaInsets.left,
                                      y: view.safeAreaInsets.top,
                                      width: view.frame.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                                      height: view.frame.height - view.safeAreaInsets.top)
    }
    
    @objc func addTapped() {
        let vc = CreateHabitViewController()
        vc.modalPresentationStyle = .fullScreen
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true, completion: nil)
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return allHabits.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIDProgress, for: indexPath) as! ProgressCollectionViewCell
            cell.updateProgress()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIDHabits, for: indexPath) as! HabitCollectionViewCell
            let a = HabitsStore.shared.habits.count - indexPath.item - 1
            let habit = HabitsStore.shared.habits[a]
            cell.habit = habit
            cell.doneButtonReloadData = {[weak self] in
                collectionView.reloadData()
            }
            cell.habitAquired = {
                HabitsStore.shared.track(habit)
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HabitDetailsViewController()
        let a = HabitsStore.shared.habits.count - indexPath.item - 1
        let habit = HabitsStore.shared.habits[a]
        vc.habit = habit
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: collectionView.frame.width - 10 * 2, height: 120)
        }else {
            return CGSize(width: collectionView.frame.width - 10 * 2, height: 60)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8,  bottom: 8, right: 8)
    }
}

