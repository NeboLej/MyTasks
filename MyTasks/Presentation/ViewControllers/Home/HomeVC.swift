import UIKit

final class HomeVC: UIViewController {
    
    private let homeView = HomeView()
    private var homeVM: HomeVM
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = homeView
//        DataHandler.getCurrentWeek()
        sutupDelegates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: HomeVM) {
        self.homeVM = viewModel
        super.init(nibName: nil, bundle: nil)  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func sutupDelegates() {
        homeView.tasksCollectionView.delegate = self
        homeView.tasksCollectionView.dataSource = self
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeVM.taskList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.cellId, for: indexPath) as! TaskCell
        let index = indexPath.item
//        print(cell.bounds)
        cell.setupCell(taskModel: homeVM.taskList[index], size: CGSize(width: cell.bounds.width, height: cell.bounds.height))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    
}
