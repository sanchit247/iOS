import UIKit
class DataVCView: UIView {
    var buyButtonPressedAction: (() -> Void)?
    var detailButtonPressedAction: (() -> Void)?
    let width : CGFloat = CGFloat(integerLiteral: 350)
    let height : CGFloat = CGFloat(integerLiteral: 45)
    var topMargin : CGFloat = CGFloat(integerLiteral: 100)
    init(buyButtonPressedAction: @escaping() -> Void , detailButtonPressedAction : @escaping() -> Void) {
        self.buyButtonPressedAction = buyButtonPressedAction
        self.detailButtonPressedAction = detailButtonPressedAction
        super.init(frame: .zero)
        backgroundColor = .white
        var childFrame : CGRect = CGRect(x: (UIScreen.main.bounds.width - width)/2, y: topMargin, width: width, height: height)
        let buyButton = UIButton(frame: childFrame)
        buyButton.setTitle("Buy Now", for: .normal)
        buyButton.backgroundColor = UIColor.magenta
        buyButton.tintColor = UIColor.white
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        addSubview(buyButton)
        
        childFrame.origin.y += childFrame.height + CGFloat(integerLiteral: 10)
        let detailButton = UIButton(frame: childFrame)
        detailButton.setTitle("Show Details", for: .normal)
        detailButton.tintColor = UIColor.white
        detailButton.backgroundColor = UIColor.blue
        detailButton.addTarget(self, action: #selector(detailButtonPressed), for: .touchUpInside)
        addSubview(detailButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buyButtonPressed(){
        buyButtonPressedAction?()
    }
    @objc func detailButtonPressed(){
        detailButtonPressedAction?()
    }
}
