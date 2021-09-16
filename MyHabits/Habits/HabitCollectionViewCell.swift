

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    var doneButtonReloadData:(() -> Void)?
    
    var habitAquired: Function?
    
    var habit: Habit? {
        didSet {
            titleLabel.text = habit?.name
            titleLabel.textColor = habit?.color
            dateLabel.text = habit?.dateString
            doneButton.layer.borderColor = habit?.color.cgColor
            doneButton.tintColor = habit?.color
            counterLabel.text = "\(habit?.trackDates.count ?? 0)"
            
            updateViews()
        }
    }
    
    var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    var dateLabel: UILabel = {
        var dateLabel = UILabel()
        dateLabel.textColor = .systemGray2
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    var counterLabel: UILabel = {
        var counterLabel = UILabel()
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.textColor = .systemGray
        counterLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return counterLabel
    }()
    
    var doneButton: AlphaButton = {
        var button = AlphaButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "StatusOffButtonGreen"), for: .normal)
        button.setBackgroundImage(UIImage(named: "StatusOnButtonGreen"), for: .selected)
        button.layer.cornerRadius = 15
        button.contentMode = .scaleToFill
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)

        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HabitCollectionViewCell {
    func setUpConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(counterLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(doneButton)
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        counterLabel.setContentHuggingPriority(.required, for: .vertical)
        dateLabel.setContentHuggingPriority(.required, for: .vertical)
        doneButton.setContentHuggingPriority(.required, for: .vertical)
        
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: doneButton.leadingAnchor, constant: -8),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            counterLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            counterLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            doneButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 36),
            doneButton.widthAnchor.constraint(equalTo: doneButton.heightAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func doneButtonPressed() {
        habitAquired?()
        updateViews()
        doneButtonReloadData?()
    }
    
    func updateViews() {
        doneButton.isSelected = self.habit?.isAlreadyTakenToday ?? false
    }
}

