//
//  TaskInfoVC.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import UIKit

class TaskInfoVC: UIViewController {
    

    let taskInfoView: TaskInfoView
    
    
    override func loadView() {
        view = taskInfoView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    init(taskModel: TaskModel) {
        taskInfoView = TaskInfoView(taskModel: taskModel)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTargets() {
        taskInfoView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        taskInfoView.changeButton.addTarget(self, action: #selector(tapChangeButton), for: .touchUpInside)
        taskInfoView.saveButton.addTarget(self, action: #selector(tapSaveButton), for: .touchUpInside)
    }
    
    @objc func tapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc func tapChangeButton() {
        taskInfoView.isChangeTasks.toggle()
    }
    
    @objc func tapSaveButton() {
        taskInfoView.isChangeTasks.toggle()
    }
    
}
