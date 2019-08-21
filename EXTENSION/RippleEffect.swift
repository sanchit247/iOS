//
//  RippleButton.swift
//  DEMORIPPLE
//
//  Created by sanchit on 21/08/19.
//  Copyright © 2019 sanchit. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func addRippleEffect(to referenceView: UIView) {
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height))
        let shapePosition = CGPoint(x: referenceView.bounds.size.width / 2.0, y: referenceView.bounds.size.height / 2.0)
        let rippleShape = CAShapeLayer()
        rippleShape.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
        rippleShape.path = path.cgPath
        rippleShape.fillColor = UIColor.clear.cgColor
        rippleShape.strokeColor = UIColor.red.cgColor
        rippleShape.lineWidth = 2
        rippleShape.position = shapePosition
        rippleShape.opacity = 0
        referenceView.layer.addSublayer(rippleShape)
        
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
        
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fromValue = 1
        opacityAnim.toValue = nil
        
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnim, opacityAnim]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = CFTimeInterval(0.7)
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = true
        
        rippleShape.add(animation, forKey: "rippleEffect")
    }
}
