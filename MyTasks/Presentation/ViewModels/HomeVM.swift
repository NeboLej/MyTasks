import Foundation

class HomeVM {
    
    private let userDefaultsManager = UserDefaultsManager()
    
    var activeTaskList: [TaskModel] {
        get {
            getActiveTaskList()
        }
        set {
            saveActiveTaskList(taskList: newValue)
        }
    }
    
    var hideTaskList: [TaskModel] {
        get {
            getHideTaskList()
        }
        set {
            saveHideTaskList(taskList: newValue)
        }
    }
    

    init() {
        activeTaskList = userDefaultsManager.getActiveTasks()
        hideTaskList = userDefaultsManager.getHideTasks()
    }
    
    private func getActiveTaskList() ->[TaskModel] {
        return userDefaultsManager.getActiveTasks()
    }
    
    private func saveActiveTaskList(taskList: [TaskModel]) {
        userDefaultsManager.saveActiveTasks(tasks: taskList)
    }
    
    private func getHideTaskList() ->[TaskModel] {
        return userDefaultsManager.getHideTasks()
    }
    
    private func saveHideTaskList(taskList: [TaskModel]) {
        userDefaultsManager.saveHideTasks(tasks: taskList)
    }
    
}
