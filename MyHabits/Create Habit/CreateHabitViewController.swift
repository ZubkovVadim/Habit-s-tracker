

import UIKit

class CreateHabitViewController: UIViewController {

    let nameHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let nameHabitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Бегать по утрам, спать по 8 часов и т.п."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return textField
    }()
    let colorHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "ЦВЕТ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let buttonColor: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addColor), for: .touchUpInside)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 15
        button.contentMode = .scaleToFill
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dateHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let dateTextLabel: UILabel = {
        let dateTextField = UILabel()
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        return dateTextField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let additionalViewForDatePicker: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        createDatePicker()
        view.addSubview(dateHabitLabel)
        view.addSubview(nameHabitLabel)
        view.addSubview(nameHabitTextField)
        view.addSubview(buttonColor)
        view.addSubview(colorHabitLabel)
        view.addSubview(dateTextLabel)
        view.addSubview(additionalViewForDatePicker)
        additionalViewForDatePicker.addSubview(datePicker)
        setUpConstraints()
        
    }
    func createDatePicker() {
        dateTextLabel.textAlignment = .left
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        dateTextLabel.text = "Каждый день в \(formatter.string(from: datePicker.date)) "
        datePicker.datePickerMode = .time
        datePicker.timeZone = .current
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    func setUpView () {
        view.backgroundColor = UIColor.white
        view.addSubview(nameHabitLabel)
        view.addSubview(nameHabitTextField)
        navigationItem.title = "Создать"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.MyTheme.myPurple
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(tappedCanceled))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.MyTheme.myPurple
    }
    
    func setUpConstraints() {
        let constraints = [
            nameHabitLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameHabitLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            nameHabitLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            nameHabitTextField.topAnchor.constraint(equalTo: nameHabitLabel.bottomAnchor, constant: 7),
            nameHabitTextField.leadingAnchor.constraint(equalTo: nameHabitLabel.leadingAnchor),
            nameHabitTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            colorHabitLabel.topAnchor.constraint(equalTo: nameHabitTextField.bottomAnchor, constant: 15),
            colorHabitLabel.leadingAnchor.constraint(equalTo: nameHabitLabel.leadingAnchor),
            
            buttonColor.topAnchor.constraint(equalTo: colorHabitLabel.bottomAnchor, constant: 7),
            buttonColor.leadingAnchor.constraint(equalTo: nameHabitLabel.leadingAnchor),
            buttonColor.heightAnchor.constraint(equalToConstant: 30),
            buttonColor.widthAnchor.constraint(equalTo: buttonColor.heightAnchor),
            
            dateHabitLabel.topAnchor.constraint(equalTo: buttonColor.bottomAnchor, constant: 15),
            dateHabitLabel.leadingAnchor.constraint(equalTo: nameHabitLabel.leadingAnchor),
            
            dateTextLabel.topAnchor.constraint(equalTo: dateHabitLabel.bottomAnchor, constant: 7),
            dateTextLabel.leadingAnchor.constraint(equalTo: nameHabitLabel.leadingAnchor),
            dateTextLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dateTextLabel.heightAnchor.constraint(equalToConstant: 22),
            
            additionalViewForDatePicker.topAnchor.constraint(equalTo: dateTextLabel.bottomAnchor, constant: 8),
            additionalViewForDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            additionalViewForDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            additionalViewForDatePicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            additionalViewForDatePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            datePicker.centerXAnchor.constraint(equalTo: additionalViewForDatePicker.centerXAnchor)
            
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    @objc func addTapped() {
        let newHabit = Habit(name: nameHabitTextField.text ?? "",
                             date: datePicker.date,
                             color: buttonColor.backgroundColor ?? .white)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        self.dismiss(animated: true, completion: nil)
        print(store.habits.count)
        
    }
    @objc func tappedCanceled() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dateChanged(_ value: UIDatePicker) {
        dateTextLabel.textAlignment = .left
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        dateTextLabel.text = "Каждый день в \(formatter.string(from: datePicker.date))"
        
        
        print(value.date)
    }
    
    @objc func addColor() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.selectedColor = self.buttonColor.backgroundColor!
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
}

extension CreateHabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.buttonColor.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.buttonColor.backgroundColor = viewController.selectedColor
    }
}
