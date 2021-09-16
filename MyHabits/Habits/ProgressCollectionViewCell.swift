

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
   
    var progress: Habit? {
        didSet {
            updateProgress()
        }
    }
 
    var titleProgressLabel: UILabel = {
        var label = UILabel()
        label.text = "Всё получится!"
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var progressView: UIProgressView = {
        var view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.MyTheme.myWhite
        view.progressTintColor = UIColor.MyTheme.myPurple
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.progressViewStyle = .bar
        return view
    }()
    
    var titlePercentLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.masksToBounds = true
        titlePercentLabel.setContentHuggingPriority(.required, for: .vertical)
        titleProgressLabel.setContentHuggingPriority(.required, for: .vertical)
        progressView.setContentHuggingPriority(.required, for: .vertical)
        contentView.addSubview(progressView)
        contentView.addSubview(titleProgressLabel)
        contentView.addSubview(titlePercentLabel)
        [

        self.titleProgressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        self.titleProgressLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
            
        self.progressView.leadingAnchor.constraint(equalTo: titleProgressLabel.leadingAnchor),
        self.progressView.trailingAnchor.constraint(equalTo: titlePercentLabel.trailingAnchor),
            self.progressView.heightAnchor.constraint(equalToConstant: 8),
        self.progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        self.titlePercentLabel.topAnchor.constraint(equalTo: titleProgressLabel.topAnchor),
        self.titlePercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ]
        .forEach { $0.isActive = true}
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateProgress() {
        progressView.setProgress(HabitsStore.shared.todayProgress, animated: false)
        titlePercentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
    }
}


