import UIKit
protocol Logout {
    func logout()
}
extension Logout where Self : UIViewController{
    func logout(){
        if FirebaseModel.shared.logout(){
            performSegue(withIdentifier: "showLoginVC", sender: self)
        }
        
    }
}
