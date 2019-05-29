import UIKit
import Firebase
class LoginViewController: UIViewController,StoryBoard {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        if FirebaseModel.shared.checkForUser() != nil {
        self.coordinator?.showRoboListVC()
        }
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            FirebaseModel.shared.loginWithEmail(email: email, password: password) { (result) in
                if result {
                    self.coordinator?.showRoboListVC()
                }
                else{
                    let alertController = UIAlertController(title: "Error", message:"Invalid login or password",preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }  
}

