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
        collectionView.allowsMultipleSelection = true
        collectionView.showsHorizontalScrollIndicator = false
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
        collectionView.allowsMultipleSelection = true
        collectionView.showsHorizontalScrollIndicator = false
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        collectionView.collectionViewLayout = layout
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
}

// MARK: - Setup Constrains

private extension StudyView {
    
    func addSubView() {
        self.addSubviews([titleLabel, subTitleLabel, collectionView, infoLabel, collectionViewDown, questionLabel, applicationButton])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: .titleLabelTopAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .TopAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.leadingTrailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: .TopAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: .collectionViewHeight),
            
            infoLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: .infoLabelTopAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.leadingTrailingAnchor),
            
            collectionViewDown.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: .TopAnchor),
            collectionViewDown.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            collectionViewDown.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .leadingTrailingAnchor),
            collectionViewDown.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: .collectionViewDownHeight),
            
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .leadingTrailingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -.questionLabelBottomAnchor),
            
            applicationButton.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor, constant: .applicationButtonLeadingAnchor),
            applicationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.leadingTrailingAnchor),
            applicationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -.applicationButtonBottomAnchor),
            applicationButton.heightAnchor.constraint(equalToConstant: .applicationButtonHeightAnchor)
        ])
    }
}

// MARK: - Constant Constraints

private extension CGFloat {
    
    static let titleLabelTopAnchor: CGFloat = 24
    static let leadingTrailingAnchor: CGFloat = 20
    static let TopAnchor: CGFloat = 12
    static let collectionViewHeight: CGFloat = 0.1
    static let infoLabelTopAnchor: CGFloat = 24
    static let collectionViewDownHeight: CGFloat = 0.170
    static let questionLabelBottomAnchor: CGFloat = 78
    static let applicationButtonLeadingAnchor: CGFloat = 116
    static let applicationButtonBottomAnchor: CGFloat = 58
    static let applicationButtonHeightAnchor: CGFloat = 60
}
