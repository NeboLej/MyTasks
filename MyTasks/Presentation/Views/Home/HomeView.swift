import UIKit

class HomeView: UIView {
    
    lazy var progressBarView: ProgressBarView = {
        let progresBar = ProgressBarView()
        progresBar.translatesAutoresizingMaskIntoConstraints = false
        return progresBar
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        backgroundColor = .background
    }
    
    private func addSubviews() {
        addSubview(progressBarView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            progressBarView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            progressBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progressBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            progressBarView.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
}
