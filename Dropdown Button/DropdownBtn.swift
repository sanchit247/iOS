import UIKit
@IBDesignable
class DropdownBtn: UIButton  , dropDownProtocol{
    // object for creating options
    var dropdownOptions = DropdownBtnOptions()
    // variable to check wheather dropdown menu are open or close
    var isOpen: Bool = false
    // variable to set height of the options view when button is touched
    var height = NSLayoutConstraint()
    var heightOfDropdown : CGFloat = 80
    
    /// function for seting up button on screen
    /// - Parameters:
    ///   - title: title for button
    ///   - backGroundColor: color of button
    ///   - titleColor: title color of button
    ///   - view: view over which button is to be placed
    // Mark: setupBtn function
    func setupBtn(parentView:UIView, dropdownMenuColor:UIColor , dropdownMenuTextColor:UIColor ,heightOfDropdownContainer : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        heightOfDropdown = heightOfDropdownContainer
        parentView.addSubview(self)
        parentView.bringSubviewToFront(self)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
        setupDropdownMenu(dropdownMenuColor:dropdownMenuColor , dropdownMenuTextColor:dropdownMenuTextColor)
    }
    /// function to setup the dropdown options position
    // MARK: setupDropdownMenu
    private func setupDropdownMenu(dropdownMenuColor:UIColor , dropdownMenuTextColor:UIColor){
        // can send your own color for tableview background color from here
        dropdownOptions.setupTableView(tableViewBackgroundColor: self.backgroundColor ?? UIColor.red,dropdownMenuColor: dropdownMenuColor, dropdownMenuTextColor: dropdownMenuTextColor)
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
        
        if isOpen == true{ dismissDropDown() }
        else{ openDropdown() }
        
    }
    // MARK: protocol function from dropdownMenu
   func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
  
    // MARK: dismissDropdown function to hide dropdown options
    private func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropdownOptions.center.y -= self.dropdownOptions.frame.height / 2
            self.dropdownOptions.layoutIfNeeded()
        }, completion: nil)
    }
    // MARK: openDropdown function to open dropdown option
    private func openDropdown(){
        isOpen = true
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = heightOfDropdown
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropdownOptions.layoutIfNeeded()
            self.dropdownOptions.center.y += self.dropdownOptions.frame.height / 2
        }, completion: nil)
        
    }
    
}
