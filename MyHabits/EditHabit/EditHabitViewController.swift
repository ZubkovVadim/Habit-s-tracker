

import UIKit

class EditHabitViewController: UIViewController {
    var deleteHandler:(() -> Void)?
    var habit: Habit? {
        didSet {
            nameHabitTextField.text = habit?.name ?? "Нет имени"
            buttonColor.backgroundColor = habit?.color
            datePicker.date = habit!.date
        }
    }
    let nameHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let nameHabitTextField: UITextField = {
        let textField = UITextField()
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
    
    let dateTextLabel: UITextField = {
        let dateTextField = UITextField()
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
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        return button
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
        view.addSubview(deleteButton)
        nameHabitTextField.text = habit?.name ?? "Нет имени"
        buttonColor.backgroundColor = habit?.color
        datePicker.date = habit!.date
        view.addSubview(additionalViewForDatePicker)
        additionalViewForDatePicker.addSubview(datePicker)
        setUpConstraints()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reloadData2()
    }
    func reloadData2() {
        habit?.color = buttonColor.backgroundColor ?? .white
        habit?.date = datePicker.date
        
    }
    func createDatePicker() {
        dateTextLabel.textAlignment = .left
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        dateTextLabel.text = "Каждый день в \(formatter.string(from: datePicker.date))"
        datePicker.datePickerMode = .time
        datePicker.timeZone = .current
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .full
        dateTextLabel.text = "Каждый день в \(formatter.string(from: datePicker.date))"
        self.view.endEditing(true)
    }
    
    func setUpView () {
        view.backgroundColor = UIColor.white
        view.addSubview(nameHabitLabel)
        view.addSubview(nameHabitTextField)
        navigationItem.title = "Править"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveTapped))
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
            additionalViewForDatePicker.bottomAnchor.constraint(equalTo: deleteButton.topAnchor),
            additionalViewForDatePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            deleteButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 22),
            deleteButton.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor),
            
            datePicker.centerXAnchor.constraint(equalTo: additionalViewForDatePicker.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //    func reloadData() {
    //        habit.
    //    }
    
    @objc func saveTapped() {
        habit?.color = buttonColor.backgroundColor ?? .white
        habit?.date = datePicker.date
        habit?.name = nameHabitTextField.text ?? ""
        HabitsStore.shared.save()
        //        reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteTapped() {
        let vc = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \(self.habit?.name ?? "Без названия")?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) {_ in print("Отмена")
        }
        vc.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Удалить", style: .default) {_ in
            self.deleteHandler?()
            
        }
        vc.addAction(deleteAction)
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @objc func tappedCanceled() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dateChanged(_ value: UIDatePicker) {
        dateTextLabel.textAlignment = .left
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        dateTextLabel.text = "Каждый день в \(formatter.string(from: datePicker.date))"
        print(value.date)
        //button.setTitle(
    }
    
    @objc func addColor() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.selectedColor = self.buttonColor.backgroundColor!
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
}

extension EditHabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.buttonColor.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.buttonColor.backgroundColor = viewController.selectedColor
    }
}

