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
        let studyVC = StudyController()
        present(studyVC, animated: true)
    }
    
}
