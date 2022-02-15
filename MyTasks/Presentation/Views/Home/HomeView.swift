import UIKit

class HomeView: UIView {
    
    lazy var progressBarView: ProgressBarView = {
        let progresBar = ProgressBarView()
        progresBar.translatesAutoresizingMaskIntoConstraints = false
        return progresBar
    }()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .baseText
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .baseText
        label.font = UIFont(name: Font.myriadProRegular, size: 25)
        label.text = "Зaдачи"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
 
    init() {
        super.init(frame: .zero)
        fillStackView()
        setupView()
        addSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        backgroundColor = .background
    }
    
    private func addSubviews() {
        addSubview(progressBarView)
        addSubview(separator)
        addSubview(label)
        addSubview(stackView)
        
    }
    
    private func fillStackView() {
        let daysDate = DataHandler.getCurrentWeek()
        let daysName = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        let currentDay = DataHandler.getCurrenDay()
        
        for index in 0...6 {
            let label = UILabel()
            label.text = String(daysDate[index]) + " " + daysName[index]
            label.numberOfLines = 2
            if daysDate[index] == currentDay {
                label.textColor = .activeText
                label.font = UIFont(name: Font.myriadProBold, size: 16)
            } else {
                label.textColor = .baseText
                label.font = UIFont(name: Font.myriadProRegular, size: 16)
            }
            stackView.addArrangedSubview(label)
        }
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            progressBarView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            progressBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progressBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            progressBarView.heightAnchor.constraint(equalToConstant: 65),
            
            separator.topAnchor.constraint(equalTo: progressBarView.bottomAnchor, constant: 20),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 2),
            
            stackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            label.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 25),
            label.widthAnchor.constraint(equalToConstant: 100)
         ])
    }
    
}
