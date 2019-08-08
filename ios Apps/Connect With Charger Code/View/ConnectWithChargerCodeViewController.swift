//
//  ConnectWithChargerCodeViewController.swift
//  WaveCharge
//
//  Created by sanchit on 06/08/19.
//  Copyright © 2019 Systronika. All rights reserved.
//

import UIKit

class ConnectWithChargerCodeViewController: UIViewController {
    
    @IBOutlet weak var chargerCodeSixthDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeFivthDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeFourthDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeThirdDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeSecondDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeFirstDigit: DesignableUITextField!
    @IBOutlet weak var chargerCodeContainerStackView: UIStackView!
    var presenter : ConnectWithChargerCodePresenter?
    var maxAllowedCharacterInOneTextField : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ConnectWithChargerCodePresenter(view: self)
        setupDelegate()
    }
    
    @IBAction func connectBtnTapped(_ sender: Any) {
        self.presenter?.connectBtnAction()
    }
    func setupDelegate(){
        chargerCodeFirstDigit.delegate = self
        chargerCodeSecondDigit.delegate = self
        chargerCodeThirdDigit.delegate = self
        chargerCodeFourthDigit.delegate = self
        chargerCodeFivthDigit.delegate = self
        chargerCodeSixthDigit.delegate = self
    }
}
extension ConnectWithChargerCodeViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        guard let preText = textField.text as NSString?,
            preText.replacingCharacters(in: range, with: string).count <= maxAllowedCharacterInOneTextField else {
                return false
        }
        return true
    }
}
