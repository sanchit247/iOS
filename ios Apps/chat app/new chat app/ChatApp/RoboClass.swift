import Foundation
import Firebase

protocol realTimeUpdate :class{
    func nearestObjectupdate(distanceResult : Int64)
}

class RoboClass{
    
    weak var delegate : realTimeUpdate!
    var roboId : String?
    let databaseRef = Database.database().reference()
    let distance:Int?
    let speed:Int?

    init(roboId:String,distance:Int,speed:Int,delegate:realTimeUpdate) {
        //
        self.roboId = roboId
        self.distance = distance
        self.speed = speed
        self.delegate = delegate
        self.databaseRef.child(self.roboId!).updateChildValues(["up":0,"down":0,"left":0,"right":0,"distance":distance,"speed":speed,"autoPilot":0])
    }
    
    func move(direction:String)
    {
        self.databaseRef.child(self.roboId!).updateChildValues([direction:1])
    }
    func stop(direction:String)
    {
        self.databaseRef.child(self.roboId!).updateChildValues([direction:0])
    }
    func dataUpdates(){
        
        self.databaseRef.child("\(self.roboId!)/nearestObj").observe(.value){(snapshot) in
        
            if let nearestObj = snapshot.value as? Int64{
                self.delegate.nearestObjectupdate(distanceResult: nearestObj)

            }
        }
    
    }
    
    func logOut()  {
        do{
            try Auth.auth().signOut()
        }
        catch{
            print("error in sign out")
        }
    }
    
    func setAutoPilot(state:Int){
        self.databaseRef.child(self.roboId!).updateChildValues(["autoPilot": state])
    }
    
}
