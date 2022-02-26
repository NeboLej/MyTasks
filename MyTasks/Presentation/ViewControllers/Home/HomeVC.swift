import UIKit

final class HomeVC: UIViewController {
    
    private let homeView = HomeView()
    private var homeVM: HomeVM
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: HomeVM) {
        self.homeVM = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTargets()
        sutupDelegates()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func sutupDelegates() {
        homeView.tasksCollectionView.delegate = self
        homeView.tasksCollectionView.dataSource = self
    }
    
    private func setupTargets() {
        homeView.addButton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
    }
    
    @objc func tapAddButton() {
        let vc = AddTaskVC()
        print("add")
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true, completion: nil)
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
        cell.taskDates = homeVM.taskList[index].dates
        cell.setupCell(taskModel: homeVM.taskList[index], size: CGSize(width: cell.bounds.width, height: cell.bounds.height))
        cell.loadBox()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

    
}
