protocol ActivityVCProtocol {
    func updateUI(data : String)
}
class ActivityVCPresenter {
    var delegate : ActivityVCProtocol
    init(delegate : ActivityVCProtocol) {
        self.delegate = delegate
    }
    func getDataFromRobo(path : String){
        FirebaseModel.shared.getData(path: path) { (text) in
            self.delegate.updateUI(data: text)
        }
    } 
}
