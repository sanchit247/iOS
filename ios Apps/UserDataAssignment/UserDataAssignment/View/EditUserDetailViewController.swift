import UIKit
class EditUserDetailViewController: UIViewController {
    var editView : EditView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
        editView = EditView(frame: frame)
        self.view.addSubview(editView)
        loadTextViewData()    
    }
    @IBAction func saveBtnPressed(_ sender: Any) {
        if validateTextView(){
            userData[currentUser].name = editView.nameTextView.text
            userData[currentUser].address = editView.addressTextView.text
            userData[currentUser].age = Float(editView.ageTextView.text) ?? 0.0
            let name = Notification.Name(rawValue: updateUserDetails)
            NotificationCenter.default.post(name: name, object: nil)
            self.dismiss(animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Invalid Details", message: "Missing fields or wrong input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    @IBAction func cancelBtnpressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func loadTextViewData(){
        editView.nameTextView.text = userData[currentUser].name
        editView.addressTextView.text = userData[currentUser].address
        editView.ageTextView.text = "\(userData[currentUser].age)"
    }
    func validateTextView()-> Bool{
        if editView.nameTextView.text != "" && editView.addressTextView.text != "" && editView.ageTextView.text != "" && editView.dateOfJoiningTextView.text != ""{
            if Float(editView.ageTextView.text) == nil {
                return false
            }
            return true
        }
        else{
            return false
        }
    }
}
