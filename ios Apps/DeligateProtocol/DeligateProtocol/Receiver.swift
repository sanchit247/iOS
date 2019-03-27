//
//  Receiver.swift
//  DeligateProtocol
//
//  Created by sanchit on 04/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class Receiver: UIViewController, DelegateName {

    @IBOutlet weak var receivinglabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func dataTobePassed(data: String) {
        
        receivinglabel.text = data
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDataField"{
            let sendingVc : SenderVc = segue.destination as! SenderVc
            sendingVc.delegate = self
 
        }
    }
    
    
}

