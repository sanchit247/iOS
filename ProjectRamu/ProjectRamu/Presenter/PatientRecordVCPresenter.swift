protocol PatientRecordVCProtocol {
    func startLoading()
    func stopLoading()
    func getServiceList(serviceList : [String:String])
}

class PatientRecordVCPresenter  {
    var delegate : PatientRecordVCProtocol
    init(delegate : PatientRecordVCProtocol) {
        self.delegate = delegate
    }
    func getServiceList(){
        FirebaseModel.shared.getServiceList { (serviceList) in
            self.delegate.getServiceList(serviceList: serviceList)
        }
    }
}
