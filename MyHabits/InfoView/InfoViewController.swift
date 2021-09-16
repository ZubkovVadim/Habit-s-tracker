

import UIKit

class InfoViewController: UIViewController {
    let infoScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let infoContainerView: UIView  = {
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
        label.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага. \n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля. \n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться. \n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств. \n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой. \n\n6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(infoContainerView)
        infoContainerView.addSubview(infoLabelViewTitle)
        infoContainerView.addSubview(infoLabelViewText1)
        setUpConstraints()
    }
    func setUpConstraints() {
    
        let constraints = [
            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            infoContainerView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor),
            infoContainerView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            infoContainerView.widthAnchor.constraint(equalTo: infoScrollView.widthAnchor),
            
            infoLabelViewTitle.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 20),
            infoLabelViewTitle.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            
            infoLabelViewText1.topAnchor.constraint(equalTo: infoLabelViewTitle.bottomAnchor, constant: 20),
            infoLabelViewText1.leadingAnchor.constraint(equalTo: infoLabelViewTitle.leadingAnchor),
            infoLabelViewText1.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -16),
            infoLabelViewText1.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor)
            

        ]
        NSLayoutConstraint.activate(constraints)
    }
}

