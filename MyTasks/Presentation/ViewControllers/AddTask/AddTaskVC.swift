import UIKit

class AddTaskVC: UIViewController {
    
    private var taskView = AddTaskView()
    
    override func loadView() {
        self.view = taskView
    }
    
//    init(taskModel: TaskModel) {
//        super.init(nibName: nil, bundle: nil)
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
