
import UIKit

class TaskViewController: UIViewController,taskModelDelegate{
    @IBOutlet weak var paginationCollectionView: UICollectionView!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var taskIdbutton: UIButton!
    @IBOutlet weak var taskTitlebutton: UIButton!
    @IBOutlet weak var taskStartButton: UIButton!
    @IBOutlet weak var taskDueButton: UIButton!
    @IBOutlet weak var taskHoursButton: UIButton!
    let picker = UIDatePicker()
    var textFieldForEntry = UITextField()
    @IBOutlet weak var taskDueDateTextField: UITextField!
    @IBOutlet weak var taskStartDateTextField: UITextField!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskIdTextField: UITextField!
    @IBOutlet weak var taskHoursTextfield: UITextField!
    @IBOutlet weak var addTaskView: UIView!
    var addTaskButtons = [UIButton]()
    var addTaskTextFields = [UITextField]()
    override func viewDidLoad() {
        super.viewDidLoad()
        paginationCollectionView.delegate = self
        paginationCollectionView.dataSource = self
        taskTableView.delegate = self
        taskTableView.dataSource = self
        TaskModel.shared.delegate = self
        TaskModel.shared.loadTask()
        addTaskToArray()
        addTaskTextFieldsToArray()
        
    }
    func didRecieveTaskUpdate(data: [taskCellData]) {
        taskTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailTask"{
            if let destinationVC = segue.destination as? DetailTaskViewController{
                
            }
        }
    }
    
    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        openAddTaskView()
    }
    
    @IBAction func setData(_ sender: UIButton) {
        for i in 0..<addTaskButtons.count{
            if i == sender.tag{
                addTaskButtons[i].alpha = 1
                addTaskTextFields[i].setCurrentTextField(isEnabled: false,borderWidth: 4, color: UIColor(red: 255, green: 147, blue: 0, alpha: 1))
                
            }
            else{
                addTaskButtons[i].alpha = 0.6
                addTaskTextFields[i].setCurrentTextField(isEnabled: true, borderWidth: 1, color: UIColor.yellow)
            }
        }
    }
    
    @IBAction func closeTaskViewButtonPressed(_ sender: UIButton) {
        closeAddTaskView()
    }
    @IBAction func setTaskDate(_ sender: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        sender.inputAccessoryView = toolBar
        sender.inputView = picker
        picker.datePickerMode = .date
        textFieldForEntry = sender
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.showCalander))
        toolBar.setItems([done], animated: true)

    }
    @objc func showCalander(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM-dd-YYYY"
        let date = dateFormat.string(from: picker.date)
        textFieldForEntry.text = date
        self.view.endEditing(true)
    }
    @IBAction func addTaskToModel(_ sender: UIButton) {
        if validateTaskField() {
            TaskModel.shared.addTask(id: taskIdTextField.text!, title: taskTitleTextField.text!, start: taskStartDateTextField.text!, end: taskDueDateTextField.text!, hours: taskHoursTextfield.text!)
            closeAddTaskView()
        }
        
    }
  
    func validateTaskField() -> Bool{
        for i in 0..<addTaskTextFields.count{
            if addTaskTextFields[i].text == "" {
                let alert = UIAlertController(title: "UIAlertController", message: "Oops! Some Fields are Missing.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    func addTaskToArray(){
        addTaskButtons.append(taskIdbutton)
        addTaskButtons.append(taskTitlebutton)
        addTaskButtons.append(taskStartButton)
        addTaskButtons.append(taskDueButton)
        addTaskButtons.append(taskHoursButton)
        for i in 0..<addTaskButtons.count{
            addTaskButtons[i].makeRounded()
        }
    }
    func addTaskTextFieldsToArray(){
        addTaskTextFields.append(taskIdTextField)
        addTaskTextFields.append(taskTitleTextField)
        addTaskTextFields.append(taskStartDateTextField)
        addTaskTextFields.append(taskDueDateTextField)
        addTaskTextFields.append(taskHoursTextfield)
    }
    func openAddTaskView(){
        self.view.bringSubviewToFront(addTaskView)
        self.addTaskView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.addTaskView.alpha = 1
        }) { (true) in
        }
    }
    func closeAddTaskView() {
        for i in 0..<addTaskTextFields.count{
            addTaskTextFields[i].text = ""
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.addTaskView.alpha = 0
        }) { (true) in
            self.addTaskView.isHidden = true
        }

    }

    
}
