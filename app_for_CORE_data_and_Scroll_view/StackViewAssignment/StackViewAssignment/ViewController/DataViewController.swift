

import UIKit
import CoreData

class DataViewController: UIViewController, dataModelDelegate {
   
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    var userIndex : Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.shared.delegate = self
        Model.shared.loadUser()
    }
    

    @IBAction func updateBtnPressed(_ sender: Any) {
        Model.shared.updateData(index: userIndex, name: userName.text!, password: password.text!)
        let alert = UIAlertController(title: "Update", message: "Data updated successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func deleteBtnPressed(_ sender: Any) {
        Model.shared.deleteUser(row: userIndex)
        let alert = UIAlertController(title: "Delete", message: "Record deleted successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func previousBtnPressed(_ sender: Any) {
        userIndex -= 1
        reloadTextfields(data: Model.shared.returnUser(index: userIndex))
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        userIndex += 1
        reloadTextfields(data: Model.shared.returnUser(index: userIndex))
    }
    
    
    func didRecieveDataUpdate(data: [User]) {
        if data.count > 0{
            reloadTextfields(data: data[userIndex])
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "No records found", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func reloadTextfields(data : User){
        userName.text = data.name
        password.text = data.password
    }
}
