import UIKit
import Firebase

class FirstPage: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwdTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.apply()
        signupBtn.apply()
       
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.cornerRadius = 150
        backgroundImage.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMaxXMaxYCorner]
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            self.performSegue(withIdentifier: "showRemote" , sender: self)
        } else {
            // No user is signed in.
            // ...
        }
        
    }
    
    
    /// MARK: function for log in
    ///
    /// - Parameter sender: name of the button pressed
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        

       Auth.auth().signIn(withEmail: emailTxt.text!, password: pwdTxt.text!) { (user, err) in
            if err != nil{
                // error occure
                print(err?.localizedDescription)
                let alertController = UIAlertController(title: "Error", message:"Invalid login or password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                // login successful
                print("user deteil : \(user!)")
                self.performSegue(withIdentifier: "showRemote" , sender: self)
            }
        }
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
    }
}
