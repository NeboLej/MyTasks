import Foundation
import UIKit

class CheckBox: UIButton {
    
    var isActiv: Bool = false {
        didSet {
            if isActiv {setImage(UIImage(named: "cbTrue"), for: .normal)}
            else {setImage(UIImage(named: "cbFalse"), for: .normal)}
        }
    }
    
    var index: Int!
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
