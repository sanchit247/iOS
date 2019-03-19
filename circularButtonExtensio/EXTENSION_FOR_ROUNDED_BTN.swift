import UIKit
extension UIButton{
    func makeRounded() {
        self.frame.size.height = self.frame.size.width
        self.layer.cornerRadius = 0.5 * self.frame.size.width
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
