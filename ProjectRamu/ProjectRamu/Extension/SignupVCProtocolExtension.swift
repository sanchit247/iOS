import UIKit
extension SignUpViewController : SignupVCprotocol{

    func setupButtons(buttons: [UIButton]) {
        for button in buttons{
            button.setImage(UIImage(named: "facebook"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        }
    }
    func showLoginVC() {
        performSegue(withIdentifier: "showLoginVC", sender: self)
    }
    
}
