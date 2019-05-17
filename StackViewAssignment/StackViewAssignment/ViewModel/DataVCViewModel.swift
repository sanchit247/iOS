import UIKit

class DataVCViewModel : NSObject, dataModelDelegate{
    var view : DataViewController?
    var userIndex : Int = 0
    
    public init(view : DataViewController) {
       super.init()
        self.view = view
        Model.shared.delegate = self
        Model.shared.loadUser()
    }
    
    func didRecieveDataUpdate(data: [User]) {
        
        if data.count > 0{
            /// check if delete last record
            if userIndex > 0{
                self.reloadTextfields(data: data[userIndex-1])
            }
            if userIndex == 0{
                self.reloadTextfields(data: data[userIndex])
            }
        }
        else{
            self.view?.userName.text = ""
            self.view?.password.text = ""
            let alert = UIAlertController(title: "Alert", message: "No records found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
            self.view!.present(alert, animated: true, completion: nil)
        }
        checkBtn()
    }
    func reloadTextfields(data : User){
        self.view!.userName.text = data.name
        self.view!.password.text = data.password
        checkBtn()
    }
    func showNextRecord(){
        userIndex += 1
        if let user =  Model.shared.returnUser(index: userIndex) {
            reloadTextfields(data:user)
            checkBtn()
        }
    }
    
    func showPreviosRecord(){
       userIndex -= 1
        if let user =  Model.shared.returnUser(index: userIndex) {
            reloadTextfields(data:user)
            checkBtn()
        }
    }
    
    func updateModel(){
        Model.shared.updateData(index: userIndex, name: self.view!.userName.text!, password: self.view!.password.text!)
        let alert = UIAlertController(title: "Update Successful", message: "Data updated successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.view!.present(alert, animated: true, completion: nil)
        checkBtn()
    }
    
    func deleteRecord(){
        if Model.shared.userArray.count > 0{
            Model.shared.deleteUser(row: userIndex)
            if userIndex > 0 {
                userIndex -= 1
            }
            let alert = UIAlertController(title: "Delete Successful", message: "Record deleted successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "done", style: UIAlertAction.Style.default, handler: nil))
            self.view!.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Unable To Delete", message: "No record found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "done", style: UIAlertAction.Style.default, handler: nil))
            self.view!.present(alert, animated: true, completion: nil)
        }
        checkBtn()
    }
    
    func checkBtn() {
        if Model.shared.userArray.count <= 1 {
            self.view!.nextBtn.isEnabled = false
            self.view!.nextBtn.backgroundColor  = UIColor.gray
            self.view!.previousBtn.isEnabled = false
            self.view!.previousBtn.backgroundColor  = UIColor.gray
        }
        else{
            if userIndex >= Model.shared.userArray.count - 1{
                self.view!.nextBtn.isEnabled = false
                self.view!.nextBtn.backgroundColor  = UIColor.gray
                self.view!.previousBtn.isEnabled = true
                self.view!.previousBtn.backgroundColor  = UIColor.green
            }
            if userIndex == 0 {
                self.view!.previousBtn.isEnabled = false
                self.view!.previousBtn.backgroundColor  = UIColor.gray
                self.view!.nextBtn.isEnabled = true
                self.view!.nextBtn.backgroundColor  = UIColor.green
            }
            if userIndex > 0 && userIndex < Model.shared.userArray.count - 1{
                self.view!.nextBtn.isEnabled = true
                self.view!.previousBtn.isEnabled = true
                self.view!.nextBtn.backgroundColor  = UIColor.green
                self.view!.previousBtn.backgroundColor  = UIColor.green
            }
        }
        
        
    }
}
