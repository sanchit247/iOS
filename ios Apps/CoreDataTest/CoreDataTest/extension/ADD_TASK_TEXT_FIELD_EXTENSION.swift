import UIKit
extension UITextField{
    func setCurrentTextField(isEnabled : Bool, borderWidth : CGFloat , color : UIColor){
        self.isEnabled = isEnabled
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}
