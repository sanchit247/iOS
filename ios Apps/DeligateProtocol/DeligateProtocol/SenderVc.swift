//
//  SenderVc.swift
//  DeligateProtocol
//
//  Created by sanchit on 04/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

protocol DelegateName {
    func dataTobePassed(data : String)
    
    
}

class SenderVc: UIViewController {

    @IBOutlet weak var userData: UITextField!
    var delegate : DelegateName? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func sendbtnPressed(_ sender: UIButton) {
        
        let data = userData.text
        if delegate != nil{
            if data != nil{
                delegate?.dataTobePassed(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    

}
