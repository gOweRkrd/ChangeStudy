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
        addTarget()
    }
    
    // MARK: - Private Methods
    
    private func addTarget() {
        mainView.mainButton.addTarget(self, action: #selector(changeScreen), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func changeScreen() {
        let studyVC = StudyController()
        present(studyVC, animated: true)
        }
    }
