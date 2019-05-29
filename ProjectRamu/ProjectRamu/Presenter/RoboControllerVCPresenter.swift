
protocol RoboControllerVCProtocol {
    func setDirectionGesture()
}
class RoboControllerVCPresenter {
    var delegate : RoboControllerVCProtocol
    init(delegate : RoboControllerVCProtocol) {
        self.delegate = delegate
    }
    func moveRobo(direction : String){
       FirebaseModel.shared.moveRobo(direction: direction)
    }
    func stopRobo(direction : String){
        FirebaseModel.shared.stopRobo(direction: direction)
    }
    func setGestureName(){
        self.delegate.setDirectionGesture()
    }
}
