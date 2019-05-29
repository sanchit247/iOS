
import UIKit

class ActivityViewController: UIViewController {
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
    

}
