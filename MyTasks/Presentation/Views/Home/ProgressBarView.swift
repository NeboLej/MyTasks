import UIKit

class ProgressBarView: UIView {

    var taskList: [TaskModel]!
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var weekDates = DateHandler.getCurrentWeek()

    
    //MARK: - Life Cycle
    init() { 
        super.init(frame: .zero)
        setupView()
        addSubview(stackView)
        initConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(taskList: [TaskModel]) {
        self.taskList = taskList
        clearStackView()
        calculationShareViews()
    }
    
    private func setupView() {
        backgroundColor = .yellow
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    private func calculationShareViews() {
        let countAllShare = getCountAllShare()
        var allPercent = 0.0
        for i in 0..<taskList.count {
            var countCompleteShare = getCountCompleteShareOfCurrentWeak(indexTask: i)
            if countCompleteShare > taskList[i].periodicity {
                countCompleteShare = taskList[i].periodicity
            }
            let percentTask: Double = Double(countCompleteShare) / Double(countAllShare)
            allPercent += percentTask
            let view = UIView()
            view.backgroundColor = taskList[i].color
            addViewToStask(view: view, multiplier: percentTask)
        }
        
        let lastView = UIView()
        lastView.backgroundColor = .black
        addViewToStask(view: lastView, multiplier: 1 - allPercent)
    }
    
    private func addViewToStask(view: UIView, multiplier: Double) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            view.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: multiplier)
        ])
    }
    
    
    private func getCountAllShare() -> Int {
        var count = 0
        taskList.forEach { model in
            count += model.periodicity
        }
        return count
    }
    
    private func getCountCompleteShareOfCurrentWeak(indexTask: Int) -> Int {
        var count = 0
        for date in weekDates {
            for dateTask in taskList[indexTask].dates {
                if date == dateTask {count += 1}
            }
        }
        return count
    }
    
    private func initConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    
    
    
}
