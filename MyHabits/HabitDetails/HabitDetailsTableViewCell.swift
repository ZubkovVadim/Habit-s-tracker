

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {
    
    var habitDateActivityLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вчера"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HabitDetailsTableViewCell {
    func setUpView() {
        contentView.addSubview(habitDateActivityLabel)
    }
    
    
    func setUpConstraints() {
        let constraints = [
            habitDateActivityLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 16),
            habitDateActivityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
