import UIKit
import CoreData
class ViewController: UIViewController,dataModelDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPersonView: UIView!
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personIdTextField: UITextField!
    @IBOutlet weak var personTaskTextField: UITextField!
    @IBOutlet weak var personBloodGroup: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addPersonView.alpha = 0
        addPersonView.isHidden = true
        Model.shared.delegate = self
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        Model.shared.loadPersons()
    }

    @IBAction func addPeople(_ sender: UIBarButtonItem) {
        self.addPersonView.bringSubviewToFront(self.tableView)
         self.addPersonView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.addPersonView.alpha = 1
        }) { (true) in
        }
    }

    @IBAction func closeAddPersonViewBtn(_ sender: UIButton) {
        hideAddPersonView()
    }

    @IBAction func addPersonToTableViewCel(_ sender: UIButton) {
        if  ( personIdTextField.text != "" && personNameTextField.text != "" ){
            Model.shared.addPerson(id: personIdTextField.text!, name: personNameTextField.text!, activeTask: personTaskTextField.text!, bloodGroup: personBloodGroup.text!)
        }
       else{
            print("values missing")
            }
        clearPersonTextfield()
        hideAddPersonView()
    }
    func hideAddPersonView() {
        clearPersonTextfield()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.addPersonView.alpha = 0
        }) { (true) in
             self.addPersonView.isHidden = true
        }
    }
    
    /// MARK : clear
    func clearPersonTextfield(){
        personBloodGroup.text = ""
        personTaskTextField.text = ""
        personIdTextField.text = ""
        personNameTextField.text = ""
    }
    func didRecieveDataUpdate(data: [Person]) {
        tableView.reloadData()
    }
    
}

