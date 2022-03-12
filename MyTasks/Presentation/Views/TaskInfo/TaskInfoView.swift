//
//  TaskInfoView.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import UIKit

class TaskInfoView: UIView {
    
    
    var isChangeTasks = false {
        didSet {
            saveButton.isHidden = !isChangeTasks
            changeButton.isHidden = isChangeTasks
            cancelButton.isEnabled = !isChangeTasks   
        }
    }
    
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
        button.isHidden = false
        //        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.textColor = .white //TODO: fix
        button.isHidden = true
        //        button.isEnabled = false
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
    
    lazy var discriptionTextField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = .clear
//        textField.isUserInteractionEnabled = false
        //        textField.placeholder = "Название"
        textField.tintColor = .white
        textField.font = UIFont(name: Font.myriadProRegular, size: 14)
        textField.textColor = .white
        textField.restorationIdentifier = "name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var periodLabel: UILabel = {
        let label = UILabel()
//        label.text = "7"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProBold, size: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    private lazy var periodNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Дней в неделю"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Неделя", "Месяц", "Год", "С начала"])
        sc.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    lazy var chartView: ChartView = {
        let chartView = ChartView(color: taskModel.color)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = .clear
        return chartView
    }()
    
    private lazy var percentNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Выполнено на"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
     lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.textColor = .white
        label.font = UIFont(name: Font.myriadProRegular, size: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var separator2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        backgroundColor = .background
        headView.backgroundColor = taskModel.color
        label.text = taskModel.name
        discriptionTextField.text = taskModel.discription
        periodLabel.text = String(taskModel.periodicity)
        segmentedControl.backgroundColor = taskModel.color.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentTintColor = taskModel.color
        
        let attrFinishButton = NSMutableAttributedString( string: "Завершить задачу", attributes: [
            .font: UIFont(name: Font.myriadProRegular, size: 20)!,
            .foregroundColor: taskModel.color])
        finishButton.setAttributedTitle(attrFinishButton, for: .normal)
        
        let attrDeleteButton = NSMutableAttributedString( string: "Удалить задачу", attributes: [
            .font: UIFont(name: Font.myriadProRegular, size: 20)!,
            .foregroundColor: UIColor.systemPink])
        deleteButton.setAttributedTitle(attrDeleteButton, for: .normal)
    }
    
    private func addSubviews() {
        addSubview(headView)
        addSubview(label)
        addSubview(cancelButton)
        addSubview(changeButton)
        addSubview(saveButton)
        addSubview(separator1)
        addSubview(discriptionTextField)
        addSubview(periodNameLabel)
        addSubview(periodLabel)
        
        addSubview(segmentedControl)
        addSubview(chartView)
        addSubview(percentNameLabel)
        addSubview(percentLabel)
        addSubview(separator2)
        addSubview(finishButton)
        addSubview(deleteButton)
        
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
            
            saveButton.topAnchor.constraint(equalTo: label.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            separator1.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator1.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 11),
            separator1.heightAnchor.constraint(equalToConstant: 1),
            
            discriptionTextField.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 25),
            discriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            discriptionTextField.trailingAnchor.constraint(equalTo: periodLabel.leadingAnchor, constant: -5),
            discriptionTextField.heightAnchor.constraint(equalToConstant: 25),
            
            periodLabel.centerYAnchor.constraint(equalTo: discriptionTextField.centerYAnchor),
            periodLabel.trailingAnchor.constraint(equalTo: periodNameLabel.leadingAnchor, constant: -5),
            periodLabel.heightAnchor.constraint(equalToConstant: 70),
            periodLabel.widthAnchor.constraint(equalToConstant: 60),
            
            periodNameLabel.centerYAnchor.constraint(equalTo: discriptionTextField.centerYAnchor),
            periodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            periodNameLabel.heightAnchor.constraint(equalToConstant: 70),
            periodNameLabel.widthAnchor.constraint(equalToConstant: 60),
            
            headView.topAnchor.constraint(equalTo: topAnchor),
            headView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headView.bottomAnchor.constraint(equalTo: discriptionTextField.bottomAnchor, constant: 15),
            
            segmentedControl.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 30),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32),
            
            chartView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            chartView.heightAnchor.constraint(equalToConstant: 280),
            
            percentNameLabel.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            percentNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            percentNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            percentNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            percentLabel.topAnchor.constraint(equalTo: percentNameLabel.bottomAnchor, constant: 0),
            percentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            percentLabel.heightAnchor.constraint(equalToConstant: 70),
            
            separator2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            separator2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            separator2.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 15),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            finishButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            finishButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            finishButton.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 20),
            finishButton.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            deleteButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
                    
        ])
        
    }
    
}
