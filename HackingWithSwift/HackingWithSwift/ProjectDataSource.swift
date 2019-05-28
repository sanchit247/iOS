import UIKit
class ProjectDataSource : NSObject , UITableViewDataSource{
    var projects : [Project] = Bundle.main.decode(from: "projects.json")
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let project = projects[indexPath.row]
        cell.bindData(attributedText: project.attributedTitle)
        return cell
    }
    func project(at index: Int) -> Project {
        return projects[index]
    }
   
    
}
