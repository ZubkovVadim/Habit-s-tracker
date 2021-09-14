//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Vadim on 29.07.2021.
//

import UIKit

class InfoViewController: UIViewController {
    let infoScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let infoConteinerView: UIView  = {
        var conteinerView = UIView()
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        return conteinerView
    }()
    
    let infoLabelViewTitle: UILabel = {
        var label = UILabel()
        label.text = "Привычка за 21 день"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let infoLabelViewText1: UILabel = {
        var label = UILabel()
        label.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText2: UILabel = {
        var label = UILabel()
        label.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText3: UILabel = {
        var label = UILabel()
        label.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText4: UILabel = {
        var label = UILabel()
        label.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText5: UILabel = {
        var label = UILabel()
        label.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText6: UILabel = {
        var label = UILabel()
        label.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoLabelViewText7: UILabel = {
        var label = UILabel()
        label.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(infoStackView)
        setUpConstraints()
        infoStackView.addArrangedSubview(infoLabelViewTitle)
        infoStackView.addArrangedSubview(infoLabelViewText1)
        infoStackView.addArrangedSubview(infoLabelViewText2)
        infoStackView.addArrangedSubview(infoLabelViewText3)
        infoStackView.addArrangedSubview(infoLabelViewText4)
        infoStackView.addArrangedSubview(infoLabelViewText5)
        infoStackView.addArrangedSubview(infoLabelViewText6)
        infoStackView.addArrangedSubview(infoLabelViewText7)
    }
    func setUpConstraints() {
    
        let constraints = [
            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            infoConteinerView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            infoConteinerView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor),
            infoConteinerView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor),
            infoConteinerView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            infoConteinerView.widthAnchor.constraint(equalTo: infoScrollView.widthAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: infoConteinerView.topAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: infoConteinerView.leadingAnchor, constant: 12),
            infoStackView.trailingAnchor.constraint(equalTo: infoConteinerView.trailingAnchor, constant: -12),
            infoStackView.bottomAnchor.constraint(equalTo: infoConteinerView.bottomAnchor, constant: -12),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

