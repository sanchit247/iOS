
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
    @IBOutlet weak var startDateLabel: UITextField!
    var addTaskButtons = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        paginationCollectionView.delegate = self
        paginationCollectionView.dataSource = self
        taskTableView.delegate = self
        taskTableView.dataSource = self
        TaskModel.shared.delegate = self
        TaskModel.shared.loadTask()
        addTaskToArray()
        
    }

    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        TaskModel.shared.addTask()
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
    
    @IBAction func setData(_ sender: UIButton) {
        for i in 0..<addTaskButtons.count{
            if i == sender.tag{
                addTaskButtons[i].alpha = 1
            }
            else{
                addTaskButtons[i].alpha = 0.6
            }
        }
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
    
    @IBAction func startTaskDate(_ sender: UITextField) {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        sender.inputAccessoryView = toolBar
        sender.inputView = picker
        picker.datePickerMode = .date
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.showCalander))
        toolBar.setItems([done], animated: true)
        
    }
    @objc func showCalander(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM-dd-YYYY"
        let date = dateFormat.string(from: picker.date)
        startDateLabel.text = date
        self.view.endEditing(true)
    }
}
