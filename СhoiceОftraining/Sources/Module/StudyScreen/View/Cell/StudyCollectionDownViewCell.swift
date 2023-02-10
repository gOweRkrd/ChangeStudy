import UIKit

final class StudyCollectionDownViewCell: UICollectionViewCell {
    
    var data: CollectionModel? {
        didSet {
            guard let data = data else { return }
            profileDevLabel.text = data.profileDevLabel
        }
    }
    
    // MARK: - UI Elements
    
    private var profileDevLabel: UILabel = {
        
        let label = UILabel()
        label.font = Fonts.SFProDisplay.semibold.font(size: 14)
        label.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        castomizeCell()
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Methods
    
    func selected(isSelected: Bool = false) {
            
            if isSelected {
                contentView.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
                profileDevLabel.textColor = UIColor.white
            } else {
                contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
                profileDevLabel.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
            }
        }
    
    // MARK: - Private Methods
    
    private func castomizeCell () {
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
    }
}

// MARK: - Setup Constrains

private extension StudyCollectionDownViewCell {
    
    func addSubView() {
        contentView.addSubviews([profileDevLabel])
    }
    
    func setupConstraints() {
            
            NSLayoutConstraint.activate([
                
                profileDevLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                profileDevLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
            ])
        }
}
