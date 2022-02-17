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
        label.text = String(getProcentTask()) + "%"
        label.font = UIFont(name: Font.myriadProRegular, size: 22)
        label.textColor = .baseText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let cellId = "TaskCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        addSubviews()
        initConstraints()
    }
    
    func setupCell(taskModel: TaskModel) {
        backgroundColor = taskModel.color
        taskName.text = taskModel.name
        procent.text = String(getProcentTask()) + "%"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
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
