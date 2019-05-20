
import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var patientRecordBtn: UIButton!
    @IBOutlet weak var robotControlBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        patientRecordBtn.makeRounded()
        robotControlBtn.makeRounded()
    }
    

}
