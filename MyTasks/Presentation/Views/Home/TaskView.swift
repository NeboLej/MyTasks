import UIKit

struct TaskModel {
    var name: String
    var color: UIColor
    var periodicity: Int
    var date: Date
}

final class TaskView: UIView {
    
    lazy var taskName: UILabel = {
        let label = UILabel()
        label.text = task.name
        label.font = UIFont(name: Font.myriadProRegular, size: 18)
        label.textColor = .baseText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var procent: UILabel = {
        let label = UILabel()
        label.text = String(getProcentTask()) + "%"
        label.font = UIFont(name: Font.myriadProRegular, size: 22)
        label.textColor = .baseText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var task: TaskModel
    
    
    
    init(taskModel: TaskModel) {
        self.task = taskModel
        super.init(frame: .zero)
        setupView()
        addSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = task.color
        alpha = 0.5
        layer.cornerRadius = 12
    }
    
    private func addSubviews() {
        addSubview(taskName)
        addSubview(procent)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            taskName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            taskName.heightAnchor.constraint(equalToConstant: 25),
            taskName.widthAnchor.constraint(equalToConstant: 150),
            
            procent.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            procent.leadingAnchor.constraint(equalTo: taskName.leadingAnchor, constant: 0),
            procent.heightAnchor.constraint(equalToConstant: 25),
            procent.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func getProcentTask() -> Int {
        return 50
    }
    
    
}
