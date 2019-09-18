//
//  TempViewController.swift
//  Pholio
//
//  Created by sanchit on 17/09/19.
//  Copyright © 2019 daffolapmac. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {

   
    @IBOutlet weak var stepperView: StepperView!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperView.setIndex(at: index)
        index += 1
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnClicked(_ sender: Any) {
        stepperView.setIndex(at: index)
        index += 1
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        index -= 1
        stepperView.setIndex(at: index)
    }
    
}
