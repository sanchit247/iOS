//
//  ViewController.swift
//  UnitTestAppExample
//
//  Created by sanchit on 26/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("test started")
    }
    func checkSquare(num : Int) -> Int {
        return num * num 
    }
    
}
extension Int{
    func sq() -> Int{
        return self * self
    }
   
}
func squareNum(num : Int) -> Int{
    return num * num
}

