//
//  DesvriptionViewController.swift
//  CoordinatorAndView
//
//  Created by sanchit on 28/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController , StoryBoard {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = DescriptionVCView()
    }

}
