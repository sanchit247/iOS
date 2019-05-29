
import UIKit

class PatientRecordViewController: UIViewController{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    var serviceList : [String:String] = [:]
    let services = ["Reports" , "Status" , "Medicines" , "Clinician" ,"Operations","Reports"]
    var presenter : PatientRecordVCPresenter?
    private let itemsPerRow: CGFloat = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidesWhenStopped = true
        self.presenter = PatientRecordVCPresenter(delegate: self)
        self.presenter?.getServiceList()
    }
}
