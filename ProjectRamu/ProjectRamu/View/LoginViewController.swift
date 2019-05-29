import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseModel.shared.checkForUser() != nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showRoboList" , sender: self)
            }
        }
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            FirebaseModel.shared.loginWithEmail(email: email, password: password) { (result) in
                if result {
                    self.performSegue(withIdentifier: "showRoboList" , sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message:"Invalid login or password",preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRoboList"{
            _ = segue.destination as! RoboListTableViewController
        }
    }
    
}

