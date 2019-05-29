import Foundation
import UIKit
protocol RoboListViewProtocol{
    func startLoading()
    func finishLoading()
    func reloadTableView(roboList : [String : RoboModel])
}
class RoboListVCPresenter{
    var delegate : RoboListViewProtocol
    var vc : RoboListTableViewController
    init(delegate : RoboListViewProtocol, vc:RoboListTableViewController) {
        self.delegate = delegate
        self.vc = vc
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
        vc.coordinator?.showActivityVC()
    }
}
