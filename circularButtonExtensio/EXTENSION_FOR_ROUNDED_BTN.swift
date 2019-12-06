import UIKit
extension UIButton{
    func makeRounded() {
        self.frame.size.height = self.frame.size.width
        self.layer.cornerRadius = 0.5 * self.frame.size.width
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
