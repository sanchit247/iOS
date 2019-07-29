//
//  ViewController.swift
//  CustomView
//
//  Created by sanchit on 29/07/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var xibFileView: XIbFileVIew!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        xibFileView.mainLabel.text = "yeah! "
    }


}

