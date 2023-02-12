import UIKit

final class StudyController: UIViewController {
    
    // MARK: - Properties

    var itemsModel: [CollectionModel] = [
        CollectionModel(profileDevLabel: "iOS"),
        CollectionModel(profileDevLabel: "Android"),
        CollectionModel(profileDevLabel: "Design"),
        CollectionModel(profileDevLabel: "Flutter"),
        CollectionModel(profileDevLabel: "QA"),
        CollectionModel(profileDevLabel: "PM"),
        CollectionModel(profileDevLabel: "C++"),
        CollectionModel(profileDevLabel: "Frontend"),
        CollectionModel(profileDevLabel: "DVH"),
        CollectionModel(profileDevLabel: "Analysts")
    ]
    
    var itemsModelDown: [CollectionModel] = [
        CollectionModel(profileDevLabel: "iOS"),
        CollectionModel(profileDevLabel: "Android"),
        CollectionModel(profileDevLabel: "Design"),
        CollectionModel(profileDevLabel: "Flutter"),
        CollectionModel(profileDevLabel: "QA"),
        CollectionModel(profileDevLabel: "PM"),
        CollectionModel(profileDevLabel: "C++"),
        CollectionModel(profileDevLabel: "Frontend"),
        CollectionModel(profileDevLabel: "DVH"),
        CollectionModel(profileDevLabel: "Analysts")
    ]
    
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
    
    private func arrayIndexForRowDown(_ row: Int) -> Int {
        
        return row % itemsModelDown.count
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
        
        switch collectionView {

        case studyView.collectionView:
                return itemsModel.count * 10

        case studyView.collectionViewDown:
                return itemsModelDown.count * 10

        default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
                
        case studyView.collectionView:
                
                let arrayIndex = arrayIndexForRow(indexPath.row)
                let modelObject = itemsModel[arrayIndex]
                let localIndexPath = IndexPath(row: arrayIndex, section: indexPath.section)
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StudyCollectionViewCell else {
                    fatalError("Could not dequeue cell with identifier: StudyCollectionViewCell")
                }
                cell.configure(model: modelObject)
                return cell
                
        case studyView.collectionViewDown:
                
                let arrayIndex = arrayIndexForRowDown(indexPath.row)
                let modelObjectDown = itemsModelDown[arrayIndex]
                let localIndexPath = IndexPath(row: arrayIndex, section: indexPath.section)
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: indexPath) as? StudyCollectionDownViewCell
                else {
                    fatalError("Could not dequeue cell with identifier: StudyCollectionDownViewCell")
                }
                cell.configureCell(model: modelObjectDown)
                return cell
                
        default:
                let arrayIndex = arrayIndexForRowDown(indexPath.row)
                let modelObjectDown = itemsModelDown[arrayIndex]
                let localIndexPath = IndexPath(row: arrayIndex, section: indexPath.section)
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: indexPath) as? StudyCollectionDownViewCell
                else {
                    fatalError("Could not dequeue cell with identifier: StudyCollectionDownViewCell")
                }
                cell.configureCell(model: modelObjectDown)
                return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension StudyController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
                
        case studyView.collectionView:
                itemsModel[indexPath.row].isSelectedCell = true
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionViewCell {
                    cell.configure(model: itemsModel[indexPath.row])
                    self.animateView(cell.contentView)
                }
                
        case studyView.collectionViewDown:
                itemsModelDown[indexPath.row].isSelectedCell = true
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.configureCell(model: itemsModelDown[indexPath.row])
                    self.animateView(cell.contentView)
                }
                
        default:
                itemsModelDown[indexPath.row].isSelectedCell = true
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.configureCell(model: itemsModelDown[indexPath.row])
                    self.animateView(cell.contentView)
                }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch collectionView {
                
        case studyView.collectionView:
                itemsModel[indexPath.row].isSelectedCell = false
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionViewCell {
                    cell.configure(model: itemsModel[indexPath.row])
                    self.animateView(cell.contentView)
                }
                
        case studyView.collectionViewDown:
                itemsModelDown[indexPath.row].isSelectedCell = false
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.configureCell(model: itemsModelDown[indexPath.row])
                    self.animateView(cell.contentView)
                }
                
        default:
                itemsModelDown[indexPath.row].isSelectedCell = false
                if let cell = collectionView.cellForItem(at: indexPath) as? StudyCollectionDownViewCell {
                    cell.configureCell(model: itemsModelDown[indexPath.row])
                    self.animateView(cell.contentView)
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
