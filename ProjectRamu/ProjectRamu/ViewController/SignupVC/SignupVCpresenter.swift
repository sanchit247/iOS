import UIKit
protocol SignupVCprotocol {
    func setupButtons(buttons : [UIButton])
}
class SignupVCPresenter{
    var delegate : SignupVCprotocol
    init(delegate : SignupVCprotocol) {
        self.delegate = delegate
    }
    func setupSignupOptionButtons(buttons : [UIButton]){
        self.delegate.setupButtons(buttons: buttons)
    }
}
