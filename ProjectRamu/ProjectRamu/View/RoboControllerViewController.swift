
import UIKit
import AVFoundation
class RoboControllerViewController: UIViewController {
    @IBOutlet var downButtonGesture: UILongPressGestureRecognizer!
    @IBOutlet var leftButtonGesture: UILongPressGestureRecognizer!
    @IBOutlet var rightButtonGesture: UILongPressGestureRecognizer!
    @IBOutlet var upButtonGesture: UILongPressGestureRecognizer!
    var presenter : RoboControllerVCPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RoboControllerVCPresenter(delegate: self)
        self.presenter?.setGestureName()
    }
    @IBAction func directionButtonPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
            self.presenter?.moveRobo(direction: "\(sender.name!)")
        }
        if sender.state == .ended{
           self.presenter?.stopRobo(direction: "\(sender.name!)")
        }
        
    }
}
