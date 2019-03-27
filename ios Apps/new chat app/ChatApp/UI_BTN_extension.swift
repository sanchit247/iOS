//
//  RoundButton.swift
//  ChatApp
//
//  Created by sanchit on 15/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import Foundation
import UIKit

enum DIRECTIONS: String{
    case UP = "up"
    case DOWN = "down"
    case LEFT = "left"
    case RIGHT = "right"
}

extension UIButton{
    func apply(){
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.shadowColor = self.layer.backgroundColor
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 0.8	
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
}
    
        var moveDirection: String {
            let tag = self.tag
            
            switch tag {
            case 0:
                return DIRECTIONS.UP.rawValue
                
            case 1:
                return DIRECTIONS.RIGHT.rawValue
                
            case 2:
                return DIRECTIONS.DOWN.rawValue
            case 3:
                return DIRECTIONS.LEFT.rawValue
                
            default:
                
                return "None"
            }
        }
    

}
