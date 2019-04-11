import UIKit
class EditView: UIView {
    public let nameTextView : UITextView
    public let addressTextView : UITextView
    public let ageTextView : UITextView
    public let dateOfJoiningTextView : UITextView
    var labelColor = UIColor(red: 255, green: 226, blue: 164, alpha: 1)
    
    public override init(frame: CGRect) {
        let topMargin : CGFloat = 15
        let labelWidth : CGFloat = 40
        var childFrame = CGRect(x: labelWidth/2 , y: topMargin, width: frame.width - labelWidth, height: frame.height / 7)
        nameTextView = UITextView(frame: childFrame)
        nameTextView.backgroundColor = labelColor
        nameTextView.textAlignment = .center
        nameTextView.font = customFont
        
        childFrame.origin.y += childFrame.height + topMargin
        addressTextView = UITextView(frame: childFrame)
        addressTextView.backgroundColor = labelColor
        addressTextView.textAlignment = .center
        addressTextView.font = customFont
        
        childFrame.origin.y += childFrame.height + topMargin
        ageTextView = UITextView(frame: childFrame)
        ageTextView.backgroundColor = labelColor
        ageTextView.textAlignment = .center
        ageTextView.font = customFont
        
        childFrame.origin.y += childFrame.height + topMargin
        dateOfJoiningTextView = UITextView(frame: childFrame)
        dateOfJoiningTextView.backgroundColor = labelColor
        dateOfJoiningTextView.textAlignment = .center
        dateOfJoiningTextView.font = customFont
        
        
        super.init(frame: frame)
        addSubview(nameTextView)
        addSubview(addressTextView)
        addSubview(ageTextView)
        addSubview(dateOfJoiningTextView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

