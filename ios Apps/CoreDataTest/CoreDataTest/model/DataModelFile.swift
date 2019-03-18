import UIKit
import CoreData
protocol dataModelDelegate: class{
    func didRecieveDataUpdate(data: [Person])
}
class Model {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     var personArray = [Person]()
     weak var delegate: dataModelDelegate!
     static let shared = Model()
     private init(){}
  
    /// MARK: function to add new person entity
    func addPerson(id : String , name : String , activeTask : String , bloodGroup : String){
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.id = id
//        newPerson.addToTask(activeTask)
        personArray.append(newPerson)
        savePerson()
    }

    /// MARK: Load saved data while opening app
    func loadPersons(with request : NSFetchRequest<Person> = Person.fetchRequest()){
        do{
            personArray = try context.fetch(request)
        }
        catch{
            print("error while loading data")
        }
        self.delegate.didRecieveDataUpdate(data: personArray)
    }
    
    /// MARK: function to delete a person from the array of person and database
    ///
    /// - Parameter row: row number of person to be deleted from table view
    func deletePerson(row :Int){
        context.delete(personArray[row])
        personArray.remove(at: row)
        savePerson()
    }
  
    /// MARK: save context after any updates
    func savePerson(){
        do {
            try context.save()
        }
        catch{
            print("Error while saving")
        }
        self.delegate.didRecieveDataUpdate(data: personArray)
        
    }
    func filterData(text:String){
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", text)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        loadPersons(with: request)  
    }
}
