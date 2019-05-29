import UIKit
import Firebase
class RoboListTableViewController: UITableViewController,Logout,StoryBoard{
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter : RoboListVCPresenter?
    var dataSource = RoboListVCDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator?.hidesWhenStopped = true
        tableView.dataSource = dataSource
        self.presenter = RoboListVCPresenter(delegate: self,vc : self)
        navigationItem.hidesBackButton = true
        self.presenter?.getRoboList()
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        self.logout()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.presenter?.selectedRobo(roboId: Array(self.dataSource.roboList.keys)[indexPath.row])
    }
}
