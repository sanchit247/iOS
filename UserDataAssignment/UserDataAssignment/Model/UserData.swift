import UIKit
class UserData : NSObject {
    var name : String
    var address : String
    var age : Float
    var date : String
   
    public init(name : String, address : String, age : Float,date : String){
        self.name = name
        self.address = address
        self.age = age
        self.date = date
    }
}
