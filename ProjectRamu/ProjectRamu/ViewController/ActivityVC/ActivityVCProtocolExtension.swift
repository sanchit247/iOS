extension ActivityViewController : ActivityVCProtocol{

    func updateUI(data: String) {
        self.patientNameLabel.text = "Patient Name : \(data)"
    }
}
