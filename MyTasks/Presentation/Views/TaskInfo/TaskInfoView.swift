//
//  TaskInfoView.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import UIKit


class TaskInfoView: UIView {
    
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
        button.setTitle("Назад", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить", for: .normal)
        button.titleLabel?.textColor = .white //TODO: fix
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var headView: UIView = {
        let view = UIView()
//        view.backgroundColor = .systemPink
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
        textField.isUserInteractionEnabled = false
//        textField.placeholder = "Название"
        textField.tintColor = .white
        textField.font = UIFont(name: Font.myriadProRegular, size: 20)
        textField.textColor = .white
        textField.restorationIdentifier = "name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var taskModel: TaskModel
    
    init(taskModel: TaskModel) {
        self.taskModel = taskModel
        super.init(frame: .zero)
        setupView()
        addSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        headView.backgroundColor = taskModel.color
        label.text = taskModel.name
        nameTextField.text = taskModel.discription
    }
    
    private func addSubviews() {
        
        addSubview(label)
        addSubview(cancelButton)
        addSubview(changeButton)
        addSubview(separator1)
        addSubview(nameTextField)
        addSubview(headView)
//        addSubview(label)
        
        
    }
    
    private func initConstraints() {
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            cancelButton.topAnchor.constraint(equalTo: label.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            changeButton.topAnchor.constraint(equalTo: label.topAnchor),
            changeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            changeButton.widthAnchor.constraint(equalToConstant: 100),
            changeButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
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

            
        ])
        
    }
    
    
    
    
}
