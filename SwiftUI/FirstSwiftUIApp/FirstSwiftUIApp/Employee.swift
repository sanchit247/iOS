import SwiftUI

struct Employee : Identifiable{
    var id : Int
    var name : String
    var title : String
}
#if DEBUG
let testData : [Employee] = [Employee(id: 0, name: "sanchit", title: "Owner"),
                             Employee(id: 1, name: "Ajay", title: "Digital Artist"),
                            Employee(id: 2, name: "Ray", title: "CTO"),
                            Employee(id: 3, name: "sam", title: "Sales"),
                            Employee(id: 4, name: "Kate", title: "Marketing"),
                            Employee(id: 5, name: "Matt", title: "Accounts")
                            ]
#endif
