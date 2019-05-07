import UIKit
class EditUserDetailViewController: UIViewController {
    var editView : EditView!
    var screenMode: ScreenMode = .editMode
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
        editView = EditView(frame: frame)
        self.view.addSubview(editView)
        if screenMode == .editMode{
            loadTextViewData()
        }
    }
    @IBAction func saveBtnPressed(_ sender: Any) {
        if validateTextView(){
            if screenMode == .newUser{
                if validateDate(date: editView.dateOfJoiningTextView.text){
                    userData.append(UserData(name: editView.nameTextView.text, address: editView.addressTextView.text, age: Float(editView.ageTextView.text) ?? 0.0, date: editView.dateOfJoiningTextView.text))
                    currentUser = userData.count - 1
                }
                else{ displayAlert()}
            }
            else{ self.udpateData()}
            self.dismiss(animated: true, completion: nil)
        }
        else{ displayAlert() }
    }
    @IBAction func cancelBtnpressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    // function activate when in edit mode to display current user data
    func loadTextViewData(){
        editView.nameTextView.text = userData[currentUser].name
        editView.addressTextView.text = userData[currentUser].address
        editView.ageTextView.text = "\(userData[currentUser].age)"
        editView.dateOfJoiningTextView.text = userData[currentUser].date
    }
//    function returns true is none of the textview is empty and age if of float type
    func validateTextView()-> Bool{
        if editView.nameTextView.text != "" && editView.addressTextView.text != "" && editView.ageTextView.text != "" && editView.dateOfJoiningTextView.text != ""{
                if Float(editView.ageTextView.text) == nil { return false }
                return true
        }
        else{ return false }
    }
//    updates the data to the main array
    func udpateData(){
        userData[currentUser].name = editView.nameTextView.text
        userData[currentUser].address = editView.addressTextView.text
        userData[currentUser].age = Float(editView.ageTextView.text) ?? 0.0
        userData[currentUser].date = editView.dateOfJoiningTextView.text
    }
    
    // validate the date for correct format
    func validateDate(date : String) -> Bool{
        let range = NSRange(location: 0, length: date.count)
        let pattern = "[0-3][0-9]/[0-1][0-9]/[1-2][0-9]{3}"
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        if regex.firstMatch(in: date, options: [], range: range) != nil{ return true }
        else { return false }
    }
    func displayAlert(){
        let alert = UIAlertController(title: "Invalid Details", message: "Missing fields or wrong input", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
