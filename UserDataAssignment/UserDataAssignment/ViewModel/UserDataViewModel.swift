import UIKit
class UserDataViewModel : NSObject {
    @objc private var classUserData : [UserData]
    private let nextBtn = Notification.Name(rawValue: nextBtnpressed)
    private let backBtn = Notification.Name(rawValue: backBtnpressed)
    var view: DisplayUserDataViewController?
   
    public init(userData : [UserData], view: DisplayUserDataViewController){
        self.classUserData = userData
        super.init()
        self.view = view
        createObserver()
    }
    
    /// function to update the labels of detail view with the current data
    ///
    /// - Parameter view: detailView is required for filling its label
    public func updateDetails(){
        if userData.count == 0{
            self.view?.userDetailView.nameLabel.text = ""
            self.view?.userDetailView.addressLabel.text = ""
            self.view?.userDetailView.ageLabel.text = ""
            lockButton()

        }
        else{
            self.classUserData = userData
            self.view?.userDetailView.nameLabel.text = self.classUserData[currentUser].name
            self.view?.userDetailView.addressLabel.text = self.classUserData[currentUser].address
            self.view?.userDetailView.ageLabel.text = "\(self.classUserData[currentUser].age)"
            self.view?.userDetailView.dateOfJoininglabel.text = dateFormatter(date:self.classUserData[currentUser].date)
            checkForBtn()
        }
        
    }
    
    /// Creating observer to move to next record when next or back button pressed
    private func createObserver(){
        self.addObserver(self, forKeyPath: #keyPath(classUserData), options: [.old, .new], context: nil)
    }
    
    // MARK: - Key-Value Observing
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(classUserData) {
            self.updateDetails()
        }
    }


    func moveNext(){
        currentUser += 1
        checkForBtn()
     }
    
    func moveBack(){
        currentUser -= 1
        checkForBtn()
    }
    
    /// function to check when to enable or disable next and back button
    func checkForBtn(){
        if currentUser == self.classUserData.count - 1 {
            toggleButton(button: (self.view?.nextBtn)!, value: false)
        }
        if currentUser == 0{
             toggleButton(button: (self.view?.backBtn)!, value: false)
        }
        if currentUser > 0{
             toggleButton(button: (self.view?.backBtn)!, value: true)
        }
        if currentUser < self.classUserData.count - 1{
            toggleButton(button: (self.view?.nextBtn)!, value: true)
        }
        if userData.count == 0{
            toggleButton(button: (self.view?.backBtn)!, value: true)
            toggleButton(button: (self.view?.nextBtn)!, value: true)
        }
    }
    
    func toggleButton(button : UIButton, value:Bool){
        button.isEnabled = value
        if value{
            button.backgroundColor = UIColor.green
        }
        else{
            button.backgroundColor = UIColor.gray
        }
    }
    func lockButton(){
        toggleButton(button: (self.view?.nextBtn)!, value: false)
        toggleButton(button: (self.view?.backBtn)!, value: false)
        toggleButton(button: (self.view?.editBtn)!, value: false)
         toggleButton(button: (self.view?.deleteBtn)!, value: false)
    }
    func dateFormatter(date : String) -> String{
        if date.count > 10{
            let startIndex = date.index(date.startIndex, offsetBy: 0)
            let endIndex = date.index(date.startIndex, offsetBy: 3)
            let year = String(date[startIndex...endIndex])
            let month = String(date[date.index(date.startIndex, offsetBy: 5)...date.index(date.startIndex, offsetBy: 6)])
            let day = String(date[date.index(date.startIndex, offsetBy: 8)...date.index(date.startIndex, offsetBy: 9)])
            let newDate = "\(day)/\(month)/\(year)"
            userData[currentUser].date = newDate
            return newDate
        }
        else {return date}
    }
}
