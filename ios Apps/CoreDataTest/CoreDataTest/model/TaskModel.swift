import UIKit
import CoreData
protocol taskModelDelegate: class{
    func didRecieveTaskUpdate(data: [taskCellData])
}
struct taskCellData{
    var isOpen : Bool
    var sectionTitle : String
    var rows = [String]()
}
class TaskModel {
    var taskTableData = [taskCellData]()
    var taskArray = [Task]()
    static var shared = TaskModel()
    weak var delegate: taskModelDelegate!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private init(){}
    
    func addTask(id:String , title : String , start : String , end : String , hours : String){
        
        let task = Task(context: context)
        task.id = id
        task.title = title
        
        taskTableData.append(taskCellData(isOpen: false, sectionTitle: task.title ?? "Missing Task Name", rows: [task.id! , task.title!]))
        saveTask()
    }
    /// MARK: Load saved task data while opening app
    func loadTask(with request : NSFetchRequest<Task> = Task.fetchRequest()){
        
        do{
            var reloadTabledata = [taskCellData]()
            taskArray = try context.fetch(request)
            for n in 0..<taskArray.count{
                reloadTabledata.append(taskCellData(isOpen: false, sectionTitle: taskArray[n].title ?? "Missing Task Name", rows: [taskArray[n].id! , taskArray[n].title!]))
            }
            taskTableData = reloadTabledata
            self.delegate.didRecieveTaskUpdate(data: taskTableData)
        }
        catch{
            print("error while loading task")
        }
        
    }
    
    /// MARK: function to delete a person from the array of person and database
    ///
    /// - Parameter row: row number of person to be deleted from table view
    func deleteTask(row :Int){
        context.delete(taskArray[row])
        taskArray.remove(at: row)
        taskTableData.remove(at: row)
        saveTask()
    }
    func filterTask(text:String){
        let request : NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", text)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        loadTask(with: request)
    }
    func saveTask(){
        do {
            try context.save()
        }
        catch{
            print("Error while saving")
        }
        self.delegate.didRecieveTaskUpdate(data: taskTableData)
    }
    
}
