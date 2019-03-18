import UIKit

extension TaskViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return TaskModel.shared.taskTableData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TaskModel.shared.taskTableData[section].isOpen == true{
            return TaskModel.shared.taskTableData[section].rows.count
        }
        else{
                return 0
        }
    
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerBtn = UIButton(type: .system)
        headerBtn.setTitle(TaskModel.shared.taskTableData[section].sectionTitle, for: .normal)
        headerBtn.backgroundColor = UIColor.blue.withAlphaComponent(0.9)
        headerBtn.addTarget(self, action: #selector(handleExpandclose), for: .touchUpInside)
        headerBtn.tag = section
        return headerBtn
    }
    @objc func handleExpandclose(button:UIButton){
        var indexPathToReload = [IndexPath]()
        let section = button.tag
        for row in TaskModel.shared.taskTableData[button.tag].rows.indices{
            print(button.tag,row)
            let indexPath = IndexPath(row: row, section: section)
            indexPathToReload.append(indexPath)
        }
        TaskModel.shared.taskTableData[section].isOpen = !TaskModel.shared.taskTableData[section].isOpen
        taskTableView.beginUpdates()
        if TaskModel.shared.taskTableData[section].isOpen {
            taskTableView.insertRows(at: indexPathToReload, with: .fade)
            button.backgroundColor = UIColor.green
        }
        else{
            taskTableView.deleteRows(at: indexPathToReload, with: .fade)
            button.backgroundColor = UIColor.blue.withAlphaComponent(0.9)
        }
        taskTableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskTitleCell", for: indexPath) as! TaskTableViewCell
        cell.bindData(text: TaskModel.shared.taskTableData[indexPath.section].sectionTitle )
        cell.selectionStyle = .none
        return cell
    }
}
