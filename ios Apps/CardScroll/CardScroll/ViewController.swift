//
//  ViewController.swift
//  CardScroll
//
//  Created by sanchit on 13/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var obj = HorizontalScrollView()
    @IBOutlet weak var scrollView: HorizontalScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.setupScrollView(cards: 5)
       
    }


}

