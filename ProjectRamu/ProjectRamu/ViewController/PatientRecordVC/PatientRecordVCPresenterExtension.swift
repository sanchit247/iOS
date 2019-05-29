extension PatientRecordViewController : PatientRecordVCProtocol{
   
    
    func startLoading() {
        self.activityIndicator.startAnimating()
    }
    func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
    func getServiceList(serviceList: [String : String]) {
        self.serviceList = serviceList
        self.collectionView.reloadData()
    }
}
