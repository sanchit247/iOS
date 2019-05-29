import Firebase

struct RoboModel {
    var name : String?
    var left : String?
    var right : String?
    var up : String?
    var down : String?
    init() {
    }
    func parse(dict:NSDictionary) -> RoboModel{
        var robo = RoboModel()
        robo.name = dict["name"] as? String ?? "no value"
        robo.up = dict["up"] as? String
        robo.down = dict["down"] as? String
        robo.left = dict["left"] as? String
        robo.right = dict["right"] as? String
        return robo
    }
   
}

