import UIKit
protocol dataModelDelegate: class{
    func didRecieveDataUpdate(data: [Person])
}
class UserData {
    var name : String
    var address : String
    var age : Float
    //var dateOfJoining : NSDate
    public init(name : String, address : String, age : Float){
        self.name = name
        self.address = address
        self.age = age
      //  self.dateOfJoining = date
    }
}
