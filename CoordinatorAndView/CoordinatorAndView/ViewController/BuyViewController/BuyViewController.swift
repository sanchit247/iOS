//
//  BuyViewController.swift
//  CoordinatorAndView
//
//  Created by sanchit on 28/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, StoryBoard {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = BuyVCView()
    }
}
