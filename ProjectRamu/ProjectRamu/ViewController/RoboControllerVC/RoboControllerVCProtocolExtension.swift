
extension RoboControllerViewController : RoboControllerVCProtocol{
    func setDirectionGesture() {
        self.upButtonGesture.name = "up"
        self.downButtonGesture.name = "down"
        self.leftButtonGesture.name = "left"
        self.rightButtonGesture.name = "right"
    }
}
