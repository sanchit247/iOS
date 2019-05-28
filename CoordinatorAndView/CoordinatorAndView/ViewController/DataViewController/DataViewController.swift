//
//  ViewController.swift
//  CoordinatorAndView
//
//  Created by sanchit on 28/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class DataViewController: UIViewController , StoryBoard {
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = DataVCView(buyButtonPressedAction: buyButtonPressed, detailButtonPressedAction: detailButtonPressed)
    }
    func buyButtonPressed(){
        coordinator?.showBuyVC()
    }
    func detailButtonPressed(){
          coordinator?.showDescriptionVC()
    }


}

