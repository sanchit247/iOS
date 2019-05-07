 import UIKit
 extension DisplayUserDataViewController{
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(disableNextButton), name: NSNotification.Name(rawValue: disableNextBtn), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(disableBackButton), name: NSNotification.Name(rawValue: disableBackBtn), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enableNextButton), name: NSNotification.Name(rawValue: enableNextBtn), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enableBackButton), name: NSNotification.Name(rawValue: enableBackBtn), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserDeatils), name: NSNotification.Name(rawValue: updateUserDetails), object: nil)
    }
    @objc func disableNextButton(){
        toggleButton(button: nextBtn, value: false)
    }
    @objc func disableBackButton(){
        toggleButton(button: backBtn, value: false)
    }
    @objc func enableNextButton(){
        toggleButton(button: nextBtn, value: true)
    }
    @objc func enableBackButton(){
        toggleButton(button: backBtn, value: true)
    }
    @objc func updateUserDeatils(){
         userDataViewModel.updateDetails()
    }
 }
 
