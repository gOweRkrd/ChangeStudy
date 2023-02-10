import UIKit

final class StudyView: UIView {
        
    // MARK: - UI Elements
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Cтажировка в Surf"
        label.font = Fonts.SFProDisplay.bold.font(size: 24)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты"
        label.font = Fonts.SFProDisplay.regular.font(size: 14)
        label.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var infoLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе"
        label.font = Fonts.SFProDisplay.regular.font(size: 14)
        label.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var collectionViewDown: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var questionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = Fonts.SFProDisplay.regular.font(size: 14)
        label.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        return label
    }()
    
    lazy var applicationButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        button.titleLabel?.font = Fonts.SFProDisplay.regular.font(size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 29
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubView()
        setupConstraints()
        backgroundColor = .white
        
        collectionView.register(StudyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewDown.register(StudyCollectionDownViewCell.self, forCellWithReuseIdentifier: "cellDown")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func setupSpacingCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
//        layout.minimumLineSpacing = spacing
        collectionViewDown.collectionViewLayout = layout
    }
}

// MARK: - Setup Constrains

private extension StudyView {
    
    func addSubView() {
        self.addSubviews([titleLabel, subTitleLabel, collectionView, infoLabel, collectionViewDown, questionLabel, applicationButton])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            
            infoLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            collectionViewDown.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            collectionViewDown.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            collectionViewDown.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            collectionViewDown.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -78),
            
            applicationButton.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor, constant: 116),
            applicationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            applicationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -58),
            applicationButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}
