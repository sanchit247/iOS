import UIKit
class DetailView: UIView {
    public let nameLabel : UILabel
    public let addressLabel : UILabel
    public let ageLabel : UILabel
    public let dateOfJoininglabel : UILabel
    var labelColor = UIColor(red: 255, green: 226, blue: 164, alpha: 1)
    var childFrame : CGRect
    var topMargin : CGFloat = 15
    var labelWidth : CGFloat = 40
    public override init(frame: CGRect) {
        childFrame = CGRect(x: labelWidth/2 , y: topMargin, width: frame.width - labelWidth, height: frame.height / 7)
        nameLabel = UILabel(frame: childFrame)
        childFrame.origin.y += childFrame.height + topMargin
        addressLabel = UILabel(frame: childFrame)
        childFrame.origin.y += childFrame.height + topMargin
        ageLabel = UILabel(frame: childFrame)
        childFrame.origin.y += childFrame.height + topMargin
        dateOfJoininglabel = UILabel(frame: childFrame)
        super.init(frame: frame)

        setupLabel(label: nameLabel)
        setupLabel(label: addressLabel)
        setupLabel(label: ageLabel)
        setupLabel(label: dateOfJoininglabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLabel(label : UILabel){
        label.backgroundColor = labelColor
        label.textAlignment = .center
        label.font = customFont
        addSubview(label)
        
    }
    
}
