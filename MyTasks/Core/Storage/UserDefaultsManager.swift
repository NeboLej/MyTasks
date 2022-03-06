//
//  UserDefaultsManager.swift
//  MyTasks
//
//  Created by Nebo on 07.03.2022.
//

import Foundation

class UserDefaultsManager {
    
    private let defaultUser = UserDefaults.standard
    
    
    private var usetTasks: [TaskModel] {
        get {
            if let data = defaultUser.value(forKey: "userTasks") as? Foundation.Data {
                return try! PropertyListDecoder().decode([TaskModel].self, from: data)
            } else {
                return []
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaultUser.set(data, forKey: "userTasks")
            }
        }
    }
    
    func saveTasks(tasks: [TaskModel]) {
        self.usetTasks = tasks
        
    }
    
    func getTasks() -> [TaskModel] {
        self.usetTasks
    }
    
}
