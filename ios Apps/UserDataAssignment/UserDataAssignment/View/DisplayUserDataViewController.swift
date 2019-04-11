import UIKit
class DisplayUserDataViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    var userDataViewModel : UserDataViewModel!
    var userDetailView : DetailView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userData.append(UserData(name: "name1", address: "address1", age: 20.0))
        userData.append(UserData(name: "name2", address: "address2", age: 21.0))
        userData.append(UserData(name: "name3", address: "address3", age: 20.5))
        userData.append(UserData(name: "name4", address: "address4", age: 23.0))
        userData.append(UserData(name: "name5", address: "address5", age: 22.6))
        setToDef()
        createObserver()
        userDataViewModel = UserDataViewModel(userData: userData)
        let frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
        userDetailView = DetailView(frame: frame)
        self.view.addSubview(userDetailView)
        userDataViewModel.updateDetails(view: userDetailView)
        
    }

    @IBAction func editBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "editDetail", sender: sender)
        
    }
    @IBAction func updateDetails(_ sender: UIButton) {
        if sender.tag == 0{
            let name = Notification.Name(rawValue: backBtnpressed)
            NotificationCenter.default.post(name: name, object: nil)
        }
        else{
            let name = Notification.Name(rawValue: nextBtnpressed)
            NotificationCenter.default.post(name: name, object: nil)
        }
        userDataViewModel.updateDetails(view: userDetailView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail"{
            if segue.destination is EditUserDetailViewController{
                //
            }
        }
    }
    func toggleButton(button : UIButton, value:Bool){
        button.isEnabled = value
        if value{
            button.backgroundColor = UIColor.green
        }
        else{
            button.backgroundColor = UIColor.gray
        }
    }
    func setToDef(){
        
    }
}

