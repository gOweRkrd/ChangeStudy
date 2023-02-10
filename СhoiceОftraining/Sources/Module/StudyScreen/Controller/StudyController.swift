import UIKit

final class StudyController: UIViewController {
    
    // MARK: - Properties
    
    private let studyView = StudyView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = studyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        setupDelegate()
    }
    
    // MARK: - Private Methods
    
    private func addTarget() {
        studyView.applicationButton.addTarget(self, action: #selector(applicationButTup), for: .touchUpInside)
    }
    
    private func setupDelegate() {
        studyView.collectionView.delegate = self
        studyView.collectionView.dataSource = self
        studyView.collectionViewDown.delegate = self
        studyView.collectionViewDown.dataSource = self
    }
    
    private func arrayIndexForRow(_ row: Int) -> Int {
        return row % itemsModel.count
    }
    
    private func animateView (_ viewToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { _ in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func applicationButTup(sender: UIButton) {
        self.animateView(sender)
        let alert = UIAlertController(title: "Поздравляем!", message: "Вашая заявка успешна отправлена!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - CollectionViewDataSource

extension StudyController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsModel.count * 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let arrayIndex = arrayIndexForRow(indexPath.row)
        let modelObject = itemsModel[arrayIndex]
        let localIndexPath = IndexPath(row: arrayIndex, section: indexPath.section)
        
        switch collectionView {
                
        case studyView.collectionView:
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: localIndexPath) as! StudyCollectionViewCell
                cell.data = modelObject
                return cell
                
        case studyView.collectionViewDown:
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: localIndexPath) as! StudyCollectionDownViewCell
                cell.data = modelObject
                return cell
        default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: localIndexPath) as! StudyCollectionDownViewCell
                cell.data = modelObject
                return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension StudyController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
                
        case studyView.collectionView:
                
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionViewCell {
                    cell.selected(isSelected: true)
                }
                
        case studyView.collectionViewDown:
                
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.selected(isSelected: true)
                }
        default:
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.selected(isSelected: true)
                }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        switch collectionView {
                
        case studyView.collectionView:
                
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionViewCell {
                    cell.selected()
                }
                
        case studyView.collectionViewDown:
                
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.selected()
                }
        default:
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.selected()
                }
        }
    }
}
// MARK: - CollectionViewDelegateFlowLayout

extension StudyController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = itemsModel[arrayIndexForRow(indexPath.row)].profileDevLabel
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 30,
                      height: collectionView.frame.width / 9)
    }
}
