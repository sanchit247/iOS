import UIKit
import CoreData
protocol dataModelDelegate: class{
    func didRecieveDataUpdate(data: [User])
}
class Model {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userArray = [User]()
    weak var delegate: dataModelDelegate!
    static let shared = Model()
    private init(){}
    
    /// MARK: function to add new user entity
    func addUser(name : String , password : String){
        let newUser = User(context: context)
        newUser.name = name
        newUser.password = password
        userArray.append(newUser)
        saveUser()
    }
    
    /// MARK: Load saved data while opening app
    func loadUser(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            userArray = try context.fetch(request) as! [User]
        }
        catch{
            print("error while loading data")
        }
        self.delegate.didRecieveDataUpdate(data: userArray)
    }
    
    /// MARK: function to delete a user from the array of user and database
    
    func deleteUser(row :Int){
        context.delete(userArray[row])
        userArray.remove(at: row)
        saveUser()
    }
    
    /// MARK: save context after any updates
    func saveUser(){
        do {
            try context.save()
        }
        catch{
            print("Error while saving")
        }
        self.delegate.didRecieveDataUpdate(data: userArray)
        
    }
    func filterData(text:String){
        let request : NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", text)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        loadUser()
    }
   
    func returnUser(index : Int) -> User? {
        print(userArray)
        if userArray.count > index {
            return userArray[index]
        } else {
            return nil
        }
    }
    
    func updateData(index : Int, name : String , password : String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "name = %@", userArray[index].name!)
        do {
            let currentUsers = try context.fetch(request)
            let updateUser = currentUsers[0] as! NSManagedObject  // 0 for first match
            updateUser.setValue(name, forKey: "name")
            updateUser.setValue(password, forKey: "password")
            saveUser()
        }
        catch{
            print(error)
        }
    }
}
