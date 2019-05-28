import UIKit
class BuyVCView: UIView {
    let width : CGFloat = CGFloat(integerLiteral: 350)
    let height : CGFloat = CGFloat(integerLiteral: 45)
    var topMargin : CGFloat = CGFloat(integerLiteral: 100)
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        let childFrame : CGRect = CGRect(x: (UIScreen.main.bounds.width - width)/2, y: topMargin, width: width, height: height)
        let titleLabel = UILabel(frame: childFrame)
        titleLabel.text = "BUY VC OPENED"
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
