import UIKit
@IBDesignable
class DropdownBtn: UIButton  , dropDownProtocol{
    // object for creating options
    var dropdownOptions = DropdownBtnOptions()
    // variable to check wheather dropdown menu are open or close
    var isOpen: Bool = false
    // variable to set height of the options view when button is touched
    var height = NSLayoutConstraint()
    override init(frame:CGRect){
        super.init(frame:frame)
    }

    /// function for seting up button on screen
    /// - Parameters:
    ///   - title: title for button
    ///   - backGroundColor: color of button
    ///   - titleColor: title color of button
    ///   - view: view over which button is to be placed
    // Mark: setupBtn function
    func setupBtn(title:String?, parentView:UIView , width:CGFloat,height:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        parentView.bringSubviewToFront(self)
        self.setTitle(title ?? "Select", for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        setupDropdownMenu()
    }
    /// function to setup the dropdown options position
    // MARK: setupDropdownMenu
    func setupDropdownMenu(){
        dropdownOptions = DropdownBtnOptions.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropdownOptions.translatesAutoresizingMaskIntoConstraints = false
        self.superview?.addSubview(dropdownOptions)
        self.superview?.bringSubviewToFront(dropdownOptions)
        dropdownOptions.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropdownOptions.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        dropdownOptions.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        height = dropdownOptions.heightAnchor.constraint(equalToConstant: 0)
    }
    // MARK: buttonTouch actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isOpen == true{
            dismissDropDown()
            isOpen = false
        }
        else{
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 150
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropdownOptions.layoutIfNeeded()
                self.dropdownOptions.center.y += self.dropdownOptions.frame.height / 2
            }, completion: nil)
            dropdownOptions.backgroundColor = UIColor.red
            isOpen = true
        }
    }
    // MARK: protocol function from dropdownMenu
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
  
    // MARK: dismissDropdown function to hide dropdown options
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropdownOptions.center.y -= self.dropdownOptions.frame.height / 2
            self.dropdownOptions.layoutIfNeeded()
        }, completion: nil)
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
