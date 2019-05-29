import UIKit
extension UIImageView{
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return 1
        }
        set{
            layer.cornerRadius = 0.5 * frame.size.width
            clipsToBounds = true
            layer.borderWidth = 3.0
            layer.borderColor = UIColor.blue.cgColor
        }
    }
}
