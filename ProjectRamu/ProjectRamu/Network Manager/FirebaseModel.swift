import Firebase
class FirebaseModel {
    static let shared = FirebaseModel()
    var roboId : String = ""
    var ref:DatabaseReference!
    var roboList = [String : RoboModel]()
    var serviceList = [String : String]()  // [ImageName : DownloadUrl]
    var currentUser : NSObject?
    private init(){}
    
    // This functions return the user information if user is logged in else return nil
    func checkForUser() -> NSObject?{
        var user : NSObject?
        if Auth.auth().currentUser != nil {
            user = Auth.auth().currentUser!
        } else{
            print("no user")
        }
        return user
    }
    
    // this function uses firebase login with email function
    func loginWithEmail(email : String , password : String, loginComplitionHandler : @escaping (Bool) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if error == nil{
                loginComplitionHandler(error == nil)
                self?.currentUser = Auth.auth().currentUser
            }
        }
    }
    
    // Function to logout the current User
    func logout() -> Bool{
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            return true
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            return false
        }
    }
    
    // This function return the list of the robots available  dbPath -> chatapp/Robo
    func getRoboList(completion : @escaping ([String : RoboModel]) -> ()){
        ref = Database.database().reference()
        self.ref.child("Robo").observe(.value, with: {(snapshot: DataSnapshot!) in
            if !snapshot.exists() {return }
            if let snap_Shot = snapshot{
                self.roboList.removeAll()
                if let data = snap_Shot.value as? NSDictionary {
                    for values in data {
                        let key = values.key as! String
                        if let dict = values.value as? NSDictionary {
                            let roboModel = RoboModel()
                            self.roboList[key] = roboModel.parse(dict: dict)
                        }
                    }
                }
                completion(self.roboList)
            }
        })
    }
    func getServiceList(completion : @escaping([String : String]) -> ()){
        self.ref.child("services").observe(.value, with: {(snapshot: DataSnapshot!) in
            if !snapshot.exists() {return }
            if let snap_Shot = snapshot{
                self.serviceList.removeAll()
                if let dict = snap_Shot.value as? NSDictionary {
                    for values in dict{
                        self.serviceList[values.key as! String] = values.value as? String
                    }
                }
                completion(self.serviceList)
            }
        })
    }
    func getData(path:String, completion : @escaping(String) -> ()){
        let childPath = "Robo/\(roboId)/\(path)"
        self.ref.child(childPath).observe(.value, with: {(snapshot: DataSnapshot!) in
            if !snapshot.exists() {return }
            if let snap_Shot = snapshot{
                completion("\(snap_Shot.value!)")
            }
        })
    }
    
    func moveRobo(direction : String){
        let path = "Robo/\(roboId)/\(direction)"
        self.ref.child(path).setValue(1)
    }
    
    func stopRobo(direction : String){
        let path = "Robo/\(roboId)/\(direction)"
        self.ref.child(path).setValue(0)
    }
    
}
