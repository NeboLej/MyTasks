import UIKit

final class TaskCell: UICollectionViewCell {
    
    
    lazy var taskName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.myriadProRegular, size: 18)
        label.textColor = .baseText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var procent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.myriadProRegular, size: 22)
        label.textColor = .baseText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var background : UIView = {
        let background = UIView()
        background.alpha = 0.5
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    lazy var circle: UIView = {
        let circle = UIView()
        return circle
    }()
    
    private lazy var weekDates = DataHandler.getCurrentWeek()
    private var taskDates: [Date]!
    private var periodicity: Int!
    
    
    
    static let cellId = "TaskCell"
    lazy var procentTest = getProcentTask()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createProgress()
        setupView()
        addSubviews()
        initConstraints()
        setupStackView()
    }
    
    func setupCell(taskModel: TaskModel, size: CGSize) {
        backgroundColor = .clear
        taskDates = taskModel.dates
        periodicity = taskModel.periodicity
        background.backgroundColor = taskModel.color
        circle.backgroundColor = taskModel.color
        taskName.text = taskModel.name
        procent.text = String(procentTest) + "%"
        
        let circleSize = getDiameter(size: size)
        circle.frame = .init(x: 0, y: 0, width: circleSize, height: circleSize)
        circle.center = .init(x: 0, y: 0)
        circle.layer.cornerRadius = circleSize/2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        alpha = 0.5
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func addSubviews() {
        
        addSubview(background)
        addSubview(circle)
        addSubview(taskName)
        addSubview(stackView)
        addSubview(procent)
    }
    
    private func getProcentTask() -> Int {
        var count = 0
        for date in weekDates {
            for dateTask in taskDates {
                if date == dateTask {count += 1}
            }
        }
        
        let percent = (100.0 / Double(periodicity))*Double(count)
        return Int(percent)
    }
    
    private func getDiameter(size: CGSize) -> CGFloat {
        let diameter = 2*(sqrt(pow(size.width, 2) + pow(size.height, 2)) / 100.0)*CGFloat(procentTest)
        return diameter
    }
    
    private func createProgress() {
        let view = UIView(frame: CGRect(x: frame.minX, y: frame.minY, width: 300, height: 300))
        view.backgroundColor = .red
        view.alpha = 0.2
        view.mask = self
    }
    
    
    private func setupStackView() {
        let currentDay = DataHandler.getCurrentDay()
        let calendar = Calendar.current
        for index in 0...6 {
            let checkBox = CheckBox()
            if calendar.component(.day, from: weekDates[index]) == calendar.component(.day, from: currentDay)  {
                checkBox.isActiv = false
            } else {
                checkBox.isActiv = true
            }
            stackView.addArrangedSubview(checkBox)
        }
    }
    
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            taskName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            taskName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            taskName.heightAnchor.constraint(equalToConstant: 25),
            taskName.widthAnchor.constraint(equalToConstant: 150),
            
            procent.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            procent.leadingAnchor.constraint(equalTo: taskName.leadingAnchor, constant: 0),
            procent.heightAnchor.constraint(equalToConstant: 25),
            procent.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 25),
            stackView.widthAnchor.constraint(equalToConstant: 185),
        ])
    }
    
    
}
