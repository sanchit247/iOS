import UIKit
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.personArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as! PeopleTableViewCell
        cell.bindData(name: Model.shared.personArray[indexPath.row].name ?? "Missing value")
        cell.selectionStyle = .none
        cell.setEditing(true, animated: true)
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            print("editing")
        }
        edit.backgroundColor = UIColor.blue
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            Model.shared.deletePerson(row : indexPath.row)
        }
        delete.backgroundColor = UIColor.red
        return [delete,edit]
    }
}
