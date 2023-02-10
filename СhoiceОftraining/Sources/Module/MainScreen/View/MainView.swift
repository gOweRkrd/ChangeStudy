import UIKit

final class MainView: UIView {
    
        // MARK: - UI Elements
        
        lazy var mainButton: UIButton = {
            
            let button = UIButton()
            button.setImage(UIImage(named: "image"), for: .normal)
            return button
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
            self.addSubviews([mainButton])
        }
        
        func setupConstraints() {
            
            NSLayoutConstraint.activate([
                
                mainButton.topAnchor.constraint(equalTo: self.topAnchor),
                mainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                mainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                mainButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                
            ])
        }
    }
