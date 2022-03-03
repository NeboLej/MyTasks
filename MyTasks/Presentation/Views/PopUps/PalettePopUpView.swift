import UIKit

class PalettePopUpView: UIView {
    
    lazy var celectColor: UIColor = arrayColors[Int.random(in: 0...arrayColors.count)]
    
    lazy var paletteCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
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
    
    func setup(completion: @escaping ()->()) {
        isHidden = false
        self.completion = completion
    }
    
    private var completion: (()->())!
    
//    let arrayColors: [UIColor] = [.systemPink, .systemRed, .systemGray, .systemYellow, .systemBlue, .systemGreen, .systemOrange, .systemIndigo, .systemPurple]
    
    
    let arrayColors: [UIColor] = [UIColor(red: 0.557, green: 0.792, blue: 0.902, alpha: 1),
                             UIColor(red: 0.129, green: 0.62, blue: 0.737, alpha: 1),
                             UIColor(red: 0.008, green: 0.188, blue: 0.278, alpha: 1),
                             UIColor(red: 1, green: 0.718, blue: 0.012, alpha: 1),
                             UIColor(red: 0.984, green: 0.522, blue: 0, alpha: 1),
    
                             UIColor(red: 0.149, green: 0.275, blue: 0.325, alpha: 1),
                             UIColor(red: 0.165, green: 0.616, blue: 0.561, alpha: 1),
                             UIColor(red: 0.914, green: 0.769, blue: 0.416, alpha: 1),
                             UIColor(red: 0.957, green: 0.635, blue: 0.38, alpha: 1),
                             UIColor(red: 0.906, green: 0.435, blue: 0.318, alpha: 1),
                             
                             UIColor(red: 0.804, green: 0.706, blue: 0.859, alpha: 1),
                             UIColor(red: 1, green: 0.784, blue: 0.867, alpha: 1),
                             UIColor(red: 1, green: 0.686, blue: 0.8, alpha: 1),
                             UIColor(red: 0.741, green: 0.878, blue: 0.996, alpha: 1),
                             UIColor(red: 0.635, green: 0.824, blue: 1, alpha: 1),
                             
                             UIColor(red: 0.996, green: 0.427, blue: 0.451, alpha: 1),
                             UIColor(red: 0.608, green: 0.365, blue: 0.898, alpha: 1),
                             UIColor(red: 1, green: 0.796, blue: 0.467, alpha: 1),
                             UIColor(red: 0.09, green: 0.765, blue: 0.698, alpha: 1),
                             UIColor(red: 0.133, green: 0.486, blue: 0.616, alpha: 1),
    
                             UIColor(red: 0.439, green: 0.839, blue: 1, alpha: 1),
                             UIColor(red: 1, green: 0.439, blue: 0.651, alpha: 1),
                             UIColor(red: 1, green: 0.592, blue: 0.439, alpha: 1),
                             UIColor(red: 1, green: 0.839, blue: 0.439, alpha: 1),
                             UIColor(red: 0.914, green: 1, blue: 0.439, alpha: 1)]
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        celectColor = arrayColors[indexPath.item]
        isHidden = true
        completion()
    }
    
}


