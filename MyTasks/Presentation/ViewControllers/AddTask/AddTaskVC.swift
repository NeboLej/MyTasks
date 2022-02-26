import UIKit

protocol VCDelegate {
    func reloadCollections(task: TaskModel)
}

class AddTaskVC: UIViewController {
    
    private var taskView = AddTaskView()
    var delegate: VCDelegate?
    
    override func loadView() {
        self.view = taskView
    }
     
    init() {
        super.init(nibName: nil, bundle: nil)
        addTargets()
        addDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("AddTaskVC - deinit")
    }
    
    private func addTargets() {
        taskView.saveButton.addTarget(self, action: #selector(tapSaveButton), for: .touchUpInside)
        taskView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
    }
    
    private func addDelegates() {
        taskView.nameTextField.delegate = self
    }
    
    @objc private func tapSaveButton() {
        delegate?.reloadCollections(task: .init(name: taskView.nameTextField.text ?? "",
                                                color: taskView.colorButton.backgroundColor!,
                                                periodicity: 3,
                                                dates: []))
        dismiss(animated: true)
    }
    
    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }
    
    func validation() {
        var isValid = true
        let name = taskView.nameTextField.text ?? ""
        
        if name.count < 3 {
            isValid = false
        }
        taskView.saveButton.isEnabled = isValid
    }

}

extension AddTaskVC: UITextFieldDelegate {
        
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validation()
        let nameText = textField.text ?? ""
        if nameText.count > 3 {
            taskView.saveButton.isEnabled = true
        }
    }
}
