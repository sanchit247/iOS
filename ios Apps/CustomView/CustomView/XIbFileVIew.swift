//
//  XIbFileVIew.swift
//  CustomView
//
//  Created by sanchit on 29/07/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class XIbFileVIew: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    /*
     @IBOutlet var contentView: XIbFileVIew!
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {  // for using custom views in code
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {  // for using custom view in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        // we are going to do stuff here
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    

}
