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
        homeVM.taskList.append(task)
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
    
    func hideTask() {
        homeVM.taskList = activeTasks + noAvciveTasks
        homeView.tasksCollectionView.reloadData()
        print("hideTask")
    }
    var activeTasks = [TaskModel]()
    var noAvciveTasks = [TaskModel]()
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        activeTasks = []
        homeVM.taskList.forEach { model in
            if model.isActive { activeTasks.append(model)} else { noAvciveTasks.append(model)}
        }
        return activeTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.cellId, for: indexPath) as! TaskCell
        cell.setupCell(taskModel: activeTasks[indexPath.item], size: CGSize(width: cell.bounds.width, height: cell.bounds.height))
        cell.loadBox()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let vc = TaskInfoVC(taskModel: activeTasks[indexPath.item], indexTask: indexPath.item)
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true, completion: nil)
        
    }
}
