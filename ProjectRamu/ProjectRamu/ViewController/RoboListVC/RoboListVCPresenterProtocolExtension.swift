extension RoboListTableViewController: RoboListViewProtocol{
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    func reloadTableView(roboList: [String : RoboModel]) {
        self.dataSource.roboList = roboList
        self.tableView.reloadData()
    }
}
