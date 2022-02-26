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
    
    let arrayColors: [UIColor] = [.systemPink, .systemRed, .systemGray, .systemYellow, .systemBlue, .systemGreen, .systemOrange, .systemIndigo, .systemPurple]
    
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
        
    }
    
    private func addSubviews() {
        addSubview(paletteCollection)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            paletteCollection.topAnchor.constraint(equalTo: topAnchor),
            paletteCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            paletteCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            paletteCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
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


