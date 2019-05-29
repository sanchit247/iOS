import Foundation
protocol RoboListViewProtocol{
    func startLoading()
    func finishLoading()
    func reloadTableView(roboList : [String : RoboModel])
    func logout()
    func moveToActivityVC()
}
class RoboListVCPresenter{
    var delegate : RoboListViewProtocol
    init(delegate : RoboListViewProtocol) {
        self.delegate = delegate
    }
    
    func getRoboList(){
        self.delegate.startLoading()
        FirebaseModel.shared.getRoboList { (roboList) in
            self.delegate.reloadTableView(roboList: roboList)
            self.delegate.finishLoading()
        }  
    }
    func selectedRobo(roboId : String){
        FirebaseModel.shared.roboId = roboId
        self.delegate.moveToActivityVC()
    }
    func logout(){
        if FirebaseModel.shared.logout(){
            self.delegate.logout()
        }
    }
}
