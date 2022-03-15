//
//  UserDefaultsManager.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import Foundation

class UserDefaultsManager {
    
    private let defaultUser = UserDefaults.standard
    
    
    private var userActiveTasks: [TaskModel] {
        get {
            if let data = defaultUser.value(forKey: "userActiveTasks") as? Foundation.Data {
                return try! PropertyListDecoder().decode([TaskModel].self, from: data)
            } else {
                return []
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaultUser.set(data, forKey: "userActiveTasks")
            }
        }
    }
    
    private var userHideTasks: [TaskModel] {
        get {
            if let data = defaultUser.value(forKey: "userHideTasks") as? Foundation.Data {
                return try! PropertyListDecoder().decode([TaskModel].self, from: data)
            } else {
                return []
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaultUser.set(data, forKey: "userHideTasks")
            }
        }
    }
    
    
    func saveActiveTasks(tasks: [TaskModel]) {
        self.userActiveTasks = tasks
    }
    
    func getActiveTasks() -> [TaskModel] {
        self.userActiveTasks
    }
    
    func saveHideTasks(tasks: [TaskModel]) {
        self.userHideTasks = tasks
    }
    
    func getHideTasks() -> [TaskModel] {
        self.userHideTasks
    }
    
}
