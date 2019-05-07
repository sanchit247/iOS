
import UIKit
struct User {
    let id : String
    let name : String
}
var APIdata = [User]()

class LazyTableViewController: UITableViewController {
    var fetchingMore = false
    var userArray = [User]()
    let numOfSections = 2
    let numOfUsers = 15
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<1000{
            let user = User.init(id: "\(i)", name: "\(i) : Srivastava")
            APIdata.append(user)
        }
      userArray.append(contentsOf: APIdata[0...numOfUsers])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return userArray.count
        }
        else if section == 1 && fetchingMore{
            return 1
        }
        else{ return 0 }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
            cell.bindData(id: userArray[indexPath.row].id, name: userArray[indexPath.row].name)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buffer", for: indexPath) as! bufferTableViewCell
            cell.buffer.startAnimating()
            return cell
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height && !fetchingMore{
            loadUsers()
        }

    }
    func loadUsers(){
        fetchingMore = true
        print("begin")
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 , execute: {
            self.fetchingMore = false
            self.userArray.append(contentsOf: APIdata[self.userArray.count...self.userArray.count + 15])
            print(self.userArray.count)
            self.tableView.reloadData()
        })
    }
    
    
}
