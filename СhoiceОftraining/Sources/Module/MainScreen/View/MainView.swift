import UIKit

final class MainView: UIView {
    
        // MARK: - UI Elements
        
        lazy var mainImage: UIImageView = {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "image")
            return imageView
        }()
    
        // MARK: - Lifecycle
        
        override init(frame: CGRect) {
            super.init(frame: frame)
          
            addSubView()
            setupConstraints()
            backgroundColor = .white
            
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
    }

    // MARK: - Setup Constrains

    private extension MainView {
        
        func addSubView() {
            self.addSubviews([mainImage])
        }
        
        func setupConstraints() {
            
            NSLayoutConstraint.activate([
                
                mainImage.topAnchor.constraint(equalTo: self.topAnchor),
                mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                mainImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                
            ])
        }
    }
