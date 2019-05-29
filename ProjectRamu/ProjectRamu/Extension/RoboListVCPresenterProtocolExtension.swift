extension RoboListTableViewController: RoboListViewProtocol{
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    func reloadTableView(roboList: [String : RoboModel]) {
        print(roboList)
        self.roboList = roboList
        self.tableView.reloadData()
    }
    func logout(){
        performSegue(withIdentifier: "showLoginVC", sender: self)
    }
    func moveToActivityVC() {
        performSegue(withIdentifier: "showActivityVC", sender: self)
    }
}
