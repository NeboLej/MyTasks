import UIKit


class ProgressBarView: UIView {
    
    
    //MARK: - Life Cycle

    init() {
        super.init(frame: .zero)
        setupView()   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemPink
        layer.cornerRadius = 12
    }
    
    
    
    
    
}
