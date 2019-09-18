//
//  StepperView.swift
//  Pholio
//
//  Created by sanchit on 17/09/19.
//  Copyright © 2019 daffolapmac. All rights reserved.
//

import UIKit

class StepperView: UIView {


    /// MARK: IBOutlets
    @IBOutlet weak var StepOneTrailingView: UIView!
    @IBOutlet weak var stepOneNotCompletedImgView: UIImageView!
    @IBOutlet weak var stepOneProgressImgView: UIImageView!
    @IBOutlet weak var stepOneCompletedImgView: UIImageView!
    @IBOutlet weak var stepOneLabel: UILabel!
    

    @IBOutlet weak var stepTwoLeadingView: UIView!
    @IBOutlet weak var stepTwoTrailingView: UIView!
    @IBOutlet weak var stepTwoNotCompletedImgView: UIImageView!
    @IBOutlet weak var stepTwoProgressImgView: UIImageView!
    @IBOutlet weak var stepTwoCompletedImgView: UIImageView!
    @IBOutlet weak var stepTwoLabel: UILabel!
    
    @IBOutlet weak var stepThreeLeadingView: UIView!
    @IBOutlet weak var stepThreeTrailingView: UIView!
    @IBOutlet weak var stepThreeNotcompletedImgView: UIImageView!
    @IBOutlet weak var stepThreeProgressImgView: UIImageView!
    @IBOutlet weak var stepThreeCompletedView: UIImageView!
    @IBOutlet weak var stepThreeLabel: UILabel!
    
    @IBOutlet weak var stepFourLeadingView: UIView!
    @IBOutlet weak var stepFourNotCompletedImgView: UIImageView!
    @IBOutlet weak var stepFourProgressImgView: UIImageView!
    @IBOutlet weak var stepFourCompletedImgView: UIImageView!
    @IBOutlet weak var stepFourLabel: UILabel!
    
    // Mark: Variables
    let font = UIFont(name: Constants.Font.medium.rawValue, size: 16)
    let greyColor : UIColor = UIColor.lightGray
    let blueColor : UIColor = UIColor(red: 34.0/255.0, green: 150.0/255.0, blue: 243.0/255.0, alpha: 1.0)
    let kCONTENT_XIB_NAME = "StepperView"
    let text:[String] = ["Select \n Image","Print \n Preview","Shipping &\n Payment","Order \n Placed"]
    
    var labelViews:[UILabel] = [UILabel]()
    var notCompletedImgs:[UIImageView] = [UIImageView]()
    var progressImgs:[UIImageView] = [UIImageView]()
    var completedImgs:[UIImageView] = [UIImageView]()
    var leadingViews:[UIView] = [UIView]()
    var trailingViews:[UIView] = [UIView]()
   
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("StepperView", owner: self, options: nil)?[0] as! UIView
        addSubview(view)
        view.frame = self.bounds
        setupView()
    }
    func setupView(){
        
        labelViews += [stepOneLabel,stepTwoLabel,stepThreeLabel,stepFourLabel]
        notCompletedImgs += [stepOneNotCompletedImgView,stepTwoNotCompletedImgView,stepThreeNotcompletedImgView,stepFourNotCompletedImgView]
        progressImgs += [stepOneProgressImgView,stepTwoProgressImgView,stepThreeProgressImgView,stepFourProgressImgView]
        completedImgs += [stepOneCompletedImgView,stepTwoCompletedImgView,stepThreeCompletedView,stepFourCompletedImgView]
        trailingViews += [StepOneTrailingView,stepTwoTrailingView,stepThreeTrailingView]
        leadingViews += [stepTwoLeadingView,stepThreeLeadingView,stepFourLeadingView]
        
        for i in 0..<labelViews.count{
            makeAttributedText(str: text[i], view: labelViews[i])
        }
        
    }
    func makeAttributedText(str : String, view: UILabel){
         let attributedString = NSMutableAttributedString(string: str)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        view.font = font
        view.attributedText = attributedString
    }
 
    func setIndex(at: Int){
        if at < 0 || at > labelViews.count{return}
        for i in 0..<labelViews.count{
            labelViews[i].textColor = i <= at ? blueColor : greyColor
            completedImgs[i].isHidden = i < at ? false : true
            progressImgs[i].isHidden = i == at ? false : true
            notCompletedImgs[i].isHidden = i > at ? false : true
            if i < labelViews.count - 1{
                trailingViews[i].backgroundColor = i < at ? blueColor : greyColor
                leadingViews[i].backgroundColor = i < at ? blueColor : greyColor
            }
            
        }
    }
}
