import UIKit

final class HomeVC: UIViewController, VCDelegate {

    
    
    private let homeView = HomeView()
    private var homeVM: HomeVM
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DataHandler.getCurrentMount()
    }
    
    init(viewModel: HomeVM) {
        self.homeVM = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTargets()
        sutupDelegates()
   
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("HomeVC - deinit")
    }
    
    func reloadCollections(task: TaskModel) {
        homeVM.activeTaskList.append(task)
        homeView.tasksCollectionView.reloadData()
    }
    
    func hideTask(index: Int) {
        let hideModel = homeVM.activeTaskList.remove(at: index)
        homeVM.hideTaskList.append(hideModel)
        homeView.tasksCollectionView.reloadData()
    }
    
    func deleteTask(index: Int) {
        homeVM.activeTaskList.remove(at: index)
        homeView.tasksCollectionView.reloadData()
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
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true, completion: nil)
    }
}




extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeVM.activeTaskList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.cellId, for: indexPath) as! TaskCell
        let index = indexPath.item

        cell.setupCell(vm: homeVM, index: index, size: CGSize(width: cell.bounds.width, height: cell.bounds.height))
        cell.loadBox()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let vc = TaskInfoVC(taskModel: homeVM.activeTaskList[indexPath.item], Index: indexPath.item)
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true, completion: nil)
        
    }
}
