import UIKit
class RoboListVCDataSource: NSObject , UITableViewDataSource {
    var roboList = [String : RoboModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return roboList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoboIDCell", for: indexPath) as! RoboIDTableViewCell
        cell.bindData(id: Array(roboList.keys)[indexPath.row])
        return cell 
    }
    
    
}
