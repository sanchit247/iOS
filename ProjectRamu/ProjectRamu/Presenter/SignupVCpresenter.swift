import UIKit
protocol SignupVCprotocol {
    func setupButtons(buttons : [UIButton])
    func showLoginVC()
}
class SignupVCPresenter{
    var delegate : SignupVCprotocol
    init(delegate : SignupVCprotocol) {
        self.delegate = delegate
    }
    func setupSignupOptionButtons(buttons : [UIButton]){
        self.delegate.setupButtons(buttons: buttons)
    }
    func showLoginVC(){
        self.delegate.showLoginVC()
    }
}
