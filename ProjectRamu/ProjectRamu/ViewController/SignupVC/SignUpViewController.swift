
import UIKit
class SignUpViewController: UIViewController,StoryBoard {
    weak var coordinator: MainCoordinator?
    var presenter : SignupVCPresenter?
    @IBOutlet weak var fbSignupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SignupVCPresenter(delegate: self)
        self.presenter?.setupSignupOptionButtons(buttons: [fbSignupBtn])
    }

    @IBAction func showLoginVC(_ sender: Any) {
        // already have an account move to loginVC
        self.coordinator?.showLoginVC()
    }
}
