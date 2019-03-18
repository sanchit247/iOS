
import UIKit

class TaskViewController: UIViewController,taskModelDelegate{
    
    
   
    @IBOutlet weak var paginationCollectionView: UICollectionView!
    @IBOutlet weak var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        paginationCollectionView.delegate = self
        paginationCollectionView.dataSource = self
        taskTableView.delegate = self
        taskTableView.dataSource = self
        TaskModel.shared.delegate = self
        TaskModel.shared.loadTask()
    }

    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        TaskModel.shared.addTask()
    }
    func didRecieveTaskUpdate(data: [taskCellData]) {
        taskTableView.reloadData()
    }
}
