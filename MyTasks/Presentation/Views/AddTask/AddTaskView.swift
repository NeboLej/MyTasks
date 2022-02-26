import UIKit

class AddTaskView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Создать задачу"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        button.titleLabel?.textColor = .white //TODO: fix
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var headView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separator1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Название"
        textField.tintColor = .white
        textField.font = UIFont(name: Font.myriadProRegular, size: 20)
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var discriptionTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Описание"
        textField.tintColor = .white
        textField.font = UIFont(name: Font.myriadProRegular, size: 18)
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var separator2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var repetitionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Повтор в неделю"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Цвет"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var separator3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separator4: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var colorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        backgroundColor = .background
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        colorButton.backgroundColor = color
        headView.backgroundColor = color
    }
    
    private func addSubviews() {
        addSubview(headView)
        addSubview(label)
        addSubview(cancelButton)
        addSubview(saveButton)
        addSubview(separator1)
        addSubview(nameTextField)
        addSubview(discriptionTextField)
        addSubview(separator2)
        addSubview(repetitionsLabel)
        addSubview(colorLabel)
        addSubview(separator3)
        addSubview(separator4)
        addSubview(colorButton)
        
    }
    
    
    private func initConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            cancelButton.topAnchor.constraint(equalTo: label.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            saveButton.topAnchor.constraint(equalTo: label.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
              
            separator1.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator1.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 11),
            separator1.heightAnchor.constraint(equalToConstant: 1),
            
            nameTextField.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 25),
            
            headView.topAnchor.constraint(equalTo: topAnchor),
            headView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headView.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            
            discriptionTextField.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 50),
            discriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            discriptionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            discriptionTextField.heightAnchor.constraint(equalToConstant: 25),
            
            separator2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separator2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separator2.topAnchor.constraint(equalTo: discriptionTextField.bottomAnchor, constant: 3),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            repetitionsLabel.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 20),
            repetitionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repetitionsLabel.widthAnchor.constraint(equalToConstant: 180),
            repetitionsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            separator3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separator3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separator3.topAnchor.constraint(equalTo: repetitionsLabel.bottomAnchor, constant: 3),
            separator3.heightAnchor.constraint(equalToConstant: 1),
            
            colorLabel.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: 20),
            colorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorLabel.widthAnchor.constraint(equalToConstant: 180),
            colorLabel.heightAnchor.constraint(equalToConstant: 20),
            
            colorButton.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: 20),
            colorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorButton.widthAnchor.constraint(equalToConstant: 20),
            colorButton.heightAnchor.constraint(equalToConstant: 20),
            
            separator4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separator4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separator4.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 3),
            separator4.heightAnchor.constraint(equalToConstant: 1),
  
        ])
        
    }
    
    
}
