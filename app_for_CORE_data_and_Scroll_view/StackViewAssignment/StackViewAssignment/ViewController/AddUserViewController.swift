
import UIKit

class AddUserViewController: UIViewController {


    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func addbtnPressed(_ sender: Any) {
        if userName.text != "" && password.text != ""{
            Model.shared.addUser(name: userName.text!, password: password.text!)
            let alert = UIAlertController(title: "Created", message: "Record created successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "done", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            userName.text = ""
            password.text = ""
        }
    }
    
    
}
