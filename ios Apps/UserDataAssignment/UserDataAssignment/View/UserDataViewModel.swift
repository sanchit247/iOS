import UIKit
class UserDataViewModel{
    private let userData : [UserData]
    private let nextBtn = Notification.Name(rawValue: nextBtnpressed)
    private let backBtn = Notification.Name(rawValue: backBtnpressed)
    public init(userData : [UserData]){
        self.userData = userData
        createObserver()
    }
    
    /// function to update the labels of detail view with the current data
    ///
    /// - Parameter view: detailView is required for filling its label
    public func updateDetails(view:DetailView){
        view.nameLabel.text = self.userData[currentUser].name
        view.addressLabel.text = self.userData[currentUser].address
        view.ageLabel.text = "\(self.userData[currentUser].age)"
        checkForBtn()
    }
    
    /// Creating observer to move to next record when next or back button pressed
    private func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(moveNext), name: nextBtn, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveBack), name: backBtn, object: nil)
    }
    @objc func moveNext(){
        currentUser += 1
        checkForBtn()
        
    }
    @objc func moveBack(){
        currentUser -= 1
        checkForBtn()
    }
    
    /// function to check when to enable or disable next and back button
    func checkForBtn(){
        if currentUser == 4{
            let name = Notification.Name(rawValue: disableNextBtn)
            NotificationCenter.default.post(name: name, object: nil)
        }
        if currentUser == 0{
            let name = Notification.Name(rawValue: disableBackBtn)
            NotificationCenter.default.post(name: name, object: nil)
        }
        if currentUser > 0{
            let name = Notification.Name(rawValue: enableBackBtn)
            NotificationCenter.default.post(name: name, object: nil)
        }
        if currentUser < 4{
            let name = Notification.Name(rawValue: enableNextBtn)
            NotificationCenter.default.post(name: name, object: nil)
        }
    }
}
