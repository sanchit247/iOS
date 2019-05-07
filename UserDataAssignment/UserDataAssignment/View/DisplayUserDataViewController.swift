import UIKit

enum ScreenMode {
    case editMode, newUser
}
class DisplayUserDataViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    var userDataViewModel : UserDataViewModel!
    var userDetailView : DetailView!
    var screenMode: ScreenMode = .editMode
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        appendData()
        userDataViewModel = UserDataViewModel(userData: userData, view: self)
        let frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
        userDetailView = DetailView(frame: frame)
        self.view.addSubview(userDetailView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         userDataViewModel.updateDetails()
    }
    @IBAction func addBtnPressed(_ sender: UIButton) {
        self.screenMode = .newUser
         performSegue(withIdentifier: "editDetail", sender: sender)
    }
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
       
        userData.remove(at: currentUser )
        if currentUser > 0{
            currentUser -= 1
        }
        userDataViewModel.updateDetails()
        
    }
    @IBAction func editBtnPressed(_ sender: UIButton) {
        self.screenMode = .editMode
        performSegue(withIdentifier: "editDetail", sender: sender)
    }
    @IBAction func updateDetails(_ sender: UIButton) {
        if sender.tag == 0{
            self.userDataViewModel.moveBack()
        }
        else{
            self.userDataViewModel.moveNext()
        }
        userDataViewModel.updateDetails()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail"{
            if segue.destination is EditUserDetailViewController{
                (segue.destination as! EditUserDetailViewController).screenMode = self.screenMode
                
            }
        }
    }
   
    func appendData(){
        userData.append(UserData(name: "name1", address: "address1", age: 20.0, date: "2012-09-20T18:25:43.511Z"))
        userData.append(UserData(name: "name2", address: "address2", age: 21.0, date: "2013-03-14T18:25:43.511Z"))
        userData.append(UserData(name: "name3", address: "address3", age: 20.5, date: "2014-02-03T18:25:43.511Z"))
        userData.append(UserData(name: "name4", address: "address4", age: 23.0, date: "2015-07-13T18:25:43.511Z"))
        userData.append(UserData(name: "name5", address: "address5", age: 22.6, date: "2016-06-08T18:25:43.511Z"))
    }
}

