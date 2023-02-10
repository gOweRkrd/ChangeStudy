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
        //        addTarget()
        setupDelegate()
    }
    
    private func setupDelegate() {
        studyView.collectionView.delegate = self
        studyView.collectionView.dataSource = self
        studyView.collectionViewDown.delegate = self
        studyView.collectionViewDown.dataSource = self
    }
}

// MARK: - CollectionViewDataSource

extension StudyController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {

        case studyView.collectionView:
                return itemsModel.count

        case studyView.collectionViewDown:
                return itemsDownModel.count

        default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {

        case studyView.collectionView:

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StudyCollectionViewCell
                cell.data = itemsModel[indexPath.item]
                return cell

        case studyView.collectionViewDown:

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: indexPath) as! StudyCollectionDownViewCell
                cell.data = itemsModel[indexPath.item]
                return cell
        default:
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDown", for: indexPath) as! StudyCollectionDownViewCell
                cell.data = itemsModel[indexPath.item]
                return cell
        }
      
    }
}

// MARK: - UICollectionViewDelegate

extension StudyController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
}

// MARK: - CollectionViewDelegateFlowLayout

extension StudyController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.width / 9)
    }
}
