import UIKit
protocol dropDownProtocol {
    func dropDownPressed(string : String)
}
class DropdownBtnOptions: UIView,UITableViewDelegate,UITableViewDataSource{
    var optionValues = [String]()
    var tableView = UITableView()
    var delegate : dropDownProtocol!
    var cellColor : UIColor = UIColor.darkGray
    var cellTextColor : UIColor = UIColor.white
    func setupTableView(tableViewBackgroundColor:UIColor,dropdownMenuColor:UIColor , dropdownMenuTextColor:UIColor){
        cellColor = dropdownMenuColor
        cellTextColor = dropdownMenuTextColor
        setTableViewColor(color: tableViewBackgroundColor)
        setTableViewConstraints()
    }
    // MARK : setTableBackgroundColor you can set your own color here
    private func setTableViewColor(color:UIColor){
        tableView.backgroundColor = color.withAlphaComponent(0.5)
        
    }
    private func setTableViewConstraints(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = optionValues[indexPath.row]
        cell.backgroundColor = cellColor
        cell.textLabel?.textColor = cellTextColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.delegate.dropDownPressed(string: optionValues[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
  
    
}
