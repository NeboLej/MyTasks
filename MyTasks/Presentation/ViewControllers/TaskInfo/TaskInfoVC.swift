//
//  TaskInfoVC.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import UIKit
import Charts

class TaskInfoVC: UIViewController {
    

    let taskInfoView: TaskInfoView
    let taskModel: TaskModel
    
    
    override func loadView() {
        view = taskInfoView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setData(interval: .week)
    }
    
    init(taskModel: TaskModel) {
        taskInfoView = TaskInfoView(taskModel: taskModel)
        self.taskModel = taskModel
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
    
    private func setData(interval: Interval) {
        var values = [ChartDataEntry]()
        let calendar = Calendar.current
        var percent = 0.0
        
        for day in DataHandler.getCurrentWeek() {
            let dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: day)
            for myDay in taskModel.dates {
                if day == myDay {
                    percent += 100.0 / Double(taskModel.periodicity)
                }
            }
            values.append(.init(x: Double(dateComponents.day!), y: percent))
        }
        
        taskInfoView.chartView.setData(dataEntryes: values)
        
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


enum Interval {
    case week
    case month
    case year
    case allTime
}
