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
    let taskIndex: Int
    var delegate: VCDelegate!
    
    
    override func loadView() {
        view = taskInfoView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setData(interval: .week)
    }
    
    init(taskModel: TaskModel, Index: Int) {
        taskInfoView = TaskInfoView(taskModel: taskModel)
        self.taskIndex = Index
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
        taskInfoView.segmentedControl.addTarget(self, action: #selector(tapSegmentControl), for: .allEvents)
        taskInfoView.finishButton.addTarget(self, action: #selector(tapHideTaskButton), for: .touchUpInside)
        taskInfoView.deleteButton.addTarget(self, action: #selector(tapDeleteTaskButton), for: .touchUpInside)
    }
    
    private func setData(interval: Interval) {
        var values = [ChartDataEntry]()
        let calendar = Calendar.current
        var percent = 0.0
        
        var taskCost = 0.0
        var currentInterval = [Date]()
        switch interval {
        case .week:
            currentInterval = DateHandler.getCurrentWeek()
            taskCost = 100.0 / Double(taskModel.periodicity)
        case .month:
            currentInterval = DateHandler.getCurrentMount()
            taskCost = 100.0 / (Double(taskModel.periodicity) * Double((currentInterval.count))/4)
        case .year:
            currentInterval = DateHandler.getCurrentYaer()
            taskCost = 100.0 / (Double(taskModel.periodicity) * Double((currentInterval.count))/4)
        case .allTime:
            print("TODO: allTime chart")
            return
        }
        
        for day in currentInterval {
            let dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: day)
            for myDay in taskModel.dates {
                if day == myDay {
                    percent += taskCost
                }
            }
            values.append(.init(x: Double(dateComponents.day!), y: percent))
        }
        taskInfoView.percentLabel.text = String(Int(percent))+"%"
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
    
    @objc func tapHideTaskButton() {
        self.delegate.hideTask(index: taskIndex)
        dismiss(animated: true)
    }
    
    @objc func tapDeleteTaskButton() {
        self.delegate.deleteTask(index: taskIndex)
        dismiss(animated: true)
    }

    @objc func tapSegmentControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: setData(interval: .week)
        case 1: setData(interval: .month)
        case 2: setData(interval: .year)
        case 3: setData(interval: .allTime)
        default: break
        }
        
    }
    
    
}


enum Interval {
    case week
    case month
    case year
    case allTime
}
