
import UIKit

class ActivityViewController: UIViewController,Logout,StoryBoard{
    weak var coordinator: MainCoordinator?
    var roboId : String?
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientRecordBtn: UIButton!
    @IBOutlet weak var robotControlBtn: UIButton!
    var presenter : ActivityVCPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ActivityVCPresenter(delegate: self)
        self.presenter?.getDataFromRobo(path: "name")
    }
    
    @IBAction func louOutButtonPressed(_ sender: Any) {
        self.logout()
    }
    
    @IBAction func roboControlBtnPressed(_ sender: Any) {
        self.coordinator?.showRoboControllerVC()
    }
    @IBAction func patientRecordBtnPressed(_ sender: Any) {
        self.coordinator?.showPatientRecordVC()
    }
}
