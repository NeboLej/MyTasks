import Foundation
import UIKit

class CheckBox: UIButton {
    
    var isActiv: Bool = false {
        didSet {
            if isActiv {setImage(UIImage(named: "checkBoxFalse"), for: .normal)}
            else {setImage(UIImage(named: "checkBoxTrue"), for: .normal)}
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
