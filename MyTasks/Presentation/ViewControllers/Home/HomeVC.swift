import UIKit

final class HomeVC: UIViewController {
    
    private let homeView = HomeView()
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    
}
