import UIKit

protocol VCDelegate {
    func reloadCollections(task: TaskModel)
    func hideTask(index: Int)
    func deleteTask(index: Int)
    func updateProgressBar()
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
        taskView.colorButton.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
    }
    
    private func addDelegates() {
        taskView.nameTextField.delegate = self
        taskView.periodTextField.delegate = self
    }
    
    @objc private func tapSaveButton() {
        delegate?.reloadCollections(task: .init(name: taskView.nameTextField.text ?? "",
                                                color: taskView.colorButton.backgroundColor!,
                                                discription: taskView.discriptionTextField.text ?? "",
                                                periodicity: Int(taskView.periodTextField.text!)!,
                                                dates: []))
        dismiss(animated: true)
    }
    
    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func tapColorButton() {
        taskView.palettePopUpView.isHidden = false
        taskView.palettePopUpView.setup { [weak self] in
            self?.taskView.headView.backgroundColor = self?.taskView.palettePopUpView.celectColor
            self?.taskView.colorButton.backgroundColor = self?.taskView.palettePopUpView.celectColor
            self?.taskView.periodTextField.backgroundColor = self?.taskView.palettePopUpView.celectColor
        }
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
        let textFieldId = textField.restorationIdentifier ?? ""
        switch textFieldId {
        case "name": validation()
        case "period":
            let text = textField.text ?? ""
            if text.count > 1 {
                textField.text?.removeLast()
            }
        default: break
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFieldId = textField.restorationIdentifier ?? ""
        switch textFieldId {
        case "name": validation()
        case "period":
            let text = textField.text ?? ""
            switch text {
            case "1", "2", "3", "4", "5", "6", "7": break
            default: textField.text = "1"
            }
        default: break
        }
    }
}
