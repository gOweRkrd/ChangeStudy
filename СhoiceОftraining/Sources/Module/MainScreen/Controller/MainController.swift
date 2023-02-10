import UIKit

final class MainController: UIViewController {
    
    // MARK: - Properties
    
    private let mainView = MainView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSheetPresentationController()
    }
    
    // MARK: - Private Methods
    
    private func changeSheetPresentationController() {
        
        let studyVC = StudyController()
        if let sheet = studyVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(studyVC, animated: true)
    }
}
