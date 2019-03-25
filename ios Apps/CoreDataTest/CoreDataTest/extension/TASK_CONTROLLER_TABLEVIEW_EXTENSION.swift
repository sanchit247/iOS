import UIKit

extension TaskViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TaskModel.shared.taskTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskTitleCell", for: indexPath) as! TaskTableViewCell
        cell.bindData(labelText: TaskModel.shared.taskTableData[indexPath.row].sectionTitle)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            print("editing")
        }
        edit.backgroundColor = UIColor.blue
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            TaskModel.shared.deleteTask(row: indexPath.row)
        }
        delete.backgroundColor = UIColor.red
        return [delete,edit]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailTask", sender: self)
    }
  
}
