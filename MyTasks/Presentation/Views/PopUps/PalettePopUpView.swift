import UIKit

class PalettePopUpView: UIView {
    
    lazy var paletteCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "palette")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackground)))
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let arrayColors: [UIColor] = [.systemPink, .systemRed, .systemGray, .systemYellow, .systemBlue, .systemGreen, .systemOrange, .systemIndigo, .systemPurple]
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        addAction()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
    }
    
    private func addSubviews() {
        addSubview(backgroundView)
        addSubview(paletteCollection)
    }
    
    private func addAction() {
        let reconizer = UIGestureRecognizer()
        reconizer.addTarget(self, action: #selector(tapBackground))
        
        backgroundView.addGestureRecognizer(reconizer)
    }
    
    @objc func tapBackground() {
        isHidden = true
    }
  
    private func initConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            paletteCollection.centerXAnchor.constraint(equalTo: centerXAnchor),
            paletteCollection.centerYAnchor.constraint(equalTo: centerYAnchor),
            paletteCollection.heightAnchor.constraint(equalToConstant: 300),
            paletteCollection.widthAnchor.constraint(equalToConstant: 200)
        ])

    }
}

extension PalettePopUpView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "palette", for: indexPath)
        cell.backgroundColor = arrayColors[indexPath.item]
        return cell
    }   
}


