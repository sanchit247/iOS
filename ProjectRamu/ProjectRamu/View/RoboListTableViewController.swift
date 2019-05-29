import UIKit
import Firebase
class RoboListTableViewController: UITableViewController{
  
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter : RoboListVCPresenter?
    var roboList = [String : RoboModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator?.hidesWhenStopped = true
        self.presenter = RoboListVCPresenter(delegate: self)
        self.presenter?.getRoboList()
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        self.presenter?.logout()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roboList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoboIDCell", for: indexPath) as! RoboIDTableViewCell
        cell.bindData(id: Array(roboList.keys)[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.presenter?.selectedRobo(roboId: Array(roboList.keys)[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLoginVC"{
            _ = segue.destination as! LoginViewController
        }
        if segue.identifier == "showActivityVC"{
            _ = segue.destination as! ActivityViewController
        }
    }
}
