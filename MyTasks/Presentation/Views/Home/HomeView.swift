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
    
    lazy var tasksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: TaskCell.cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(tasksCollectionView)
        
    }
    
    private func fillStackView() {
        let daysDate = DataHandler.getCurrentWeek()
        let daysName = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        let currentDay = DataHandler.getCurrenDay()
        let calendar = Calendar.current
//        print(calendar.component(.day, from: calendar.date(byAdding: .day, value: -1, to: date)!))
        
        for index in 0...6 {
            let label = UILabel()
            let day = calendar.component(.day, from: calendar.date(byAdding: .day, value: -1, to: daysDate[index])!)
            label.text = String(day) + " " + daysName[index]
            label.numberOfLines = 2
            if calendar.component(.day, from: daysDate[index]) == calendar.component(.day, from: currentDay) {
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
            stackView.widthAnchor.constraint(equalToConstant: 190),
            
            label.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 25),
            label.widthAnchor.constraint(equalToConstant: 100),
            
            tasksCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            tasksCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tasksCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tasksCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }
    
}
