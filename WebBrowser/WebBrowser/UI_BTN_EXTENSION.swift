//
//  UI_BTN_EXTENSION.swift
//  WebBrowser
//
//  Created by sanchit on 22/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setImageToBtn(img : UIImage){
        let image = UIImageView()
        image.frame = self.frame
        image.contentMode = .scaleAspectFit
        image.image = img
        self.addSubview(image)
    }
}
