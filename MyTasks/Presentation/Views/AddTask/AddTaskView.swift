import UIKit

class AddTaskView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Создать задачу"
        label.backgroundColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отменить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var headView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        initConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        
    }
    
    private func addSubviews() {
        addSubview(headView)
        addSubview(label)
        addSubview(cancelButton)
        addSubview(saveButton)
    }
    
    private func initConstraint() {
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            cancelButton.topAnchor.constraint(equalTo: label.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3),
            cancelButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            saveButton.topAnchor.constraint(equalTo: label.topAnchor),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            saveButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3),
            saveButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            headView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headView.topAnchor.constraint(equalTo: topAnchor),
            headView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
        ])
        
    }
    
    
}
