//
//  DataVNUnitTest.swift
//  DataVNUnitTest
//
//  Created by sanchit on 13/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import XCTest
import Foundation
@testable import StackViewAssignment

class DataVNUnitTest: XCTestCase {

    func testAppIsStarting(){
//        vc = ViewController()
//        XCTAssertNotNil(vc)
    }
    func testNoOfStacks(){
        var vc : ViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        let _ = vc?.view
        // initially no portions in stack view
        XCTAssert(vc?.stackView.subviews.count == 0)
        vc?.addBtnPressed(vc?.addBtn as Any)
        // now have one after pressing add btn
        XCTAssert(vc?.stackView.subviews.count == 1)
        vc?.deleteBtnPressed((vc?.deleteBtn)!)
        XCTAssert(vc?.stackView.subviews.count == 0)
    }
    
    func testHasRightBarButtonItem() {
        var vc : ViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        XCTAssert(vc?.navigationItem.rightBarButtonItems?[0].title == "Core Data")
        XCTAssert(vc?.navigationItem.rightBarButtonItems?[1].title == "Scroll View")
    }
    
    func testViewControllerHasNavButton(){
        var vc : ViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        if let value = vc!.value(forKey: "storyboardSegueTemplates")  {
            if let map = (value as? [AnyObject])?.compactMap({$0.value(forKey: "identifier") as? String })  {
                    print(map)
            }
        }
    }
    func testDataVCExists(){
        var dataVC : DataViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        dataVC = storyboard.instantiateViewController(withIdentifier: "DataVC") as? DataViewController
        XCTAssertNotNil(dataVC)
    }
    func testDataVcTextFields(){
        var dataVC : DataViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        dataVC = storyboard.instantiateViewController(withIdentifier: "DataVC") as? DataViewController
        _ = dataVC!.view // To call the view did load
//       XCTAssert(dataVC?.userName.text == Model.shared.userArray[0].name)
//        XCTAssert(dataVC?.password.text == Model.shared.userArray[0].password)
    }
    
    func testDataVcUpdateBtn(){
        var dataVC : DataViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        dataVC = storyboard.instantiateViewController(withIdentifier: "DataVC") as? DataViewController
        // To load the viewController
        UIApplication.shared.keyWindow?.rootViewController = dataVC
        _ = dataVC!.view // To call the view did load
        if Model.shared.userArray.count > 0{
            let UsernameBeforeUpdate = dataVC?.userName.text ?? "no user name found"
            let PasswordBeforeUpdate = dataVC?.password.text ?? "no password found"
            dataVC?.userName.text = "\(dataVC?.userName.text ?? "default value") updated"
            dataVC?.password.text = "\(dataVC!.password.text ?? "default value") updated"
            let index  = dataVC?.dataVCViewModel.userIndex
            dataVC?.updateBtnPressed(dataVC?.updateBtn as Any)
            
            // checking for alert appear for successful update
            XCTAssertTrue(dataVC?.presentedViewController is UIAlertController)
            XCTAssertEqual(dataVC?.presentedViewController?.title, "Update Successful")
            
            // checking coreData values are updated
            XCTAssertNotEqual(UsernameBeforeUpdate, Model.shared.userArray[index!].name)
            XCTAssertNotEqual(PasswordBeforeUpdate, Model.shared.userArray[index!].password)
        }
       
    }
    func testDataVcDeleteBtn(){
        var dataVC : DataViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        dataVC = storyboard.instantiateViewController(withIdentifier: "DataVC") as? DataViewController
        UIApplication.shared.keyWindow?.rootViewController = dataVC
        _ = dataVC!.view // To call the view did load
        //Model.shared.delegate = self
        while(Model.shared.userArray.count > 1){
            var currentUsername = dataVC?.userName.text ?? "no user name found"
            var currentPassword = dataVC?.password.text ?? "no password found"
            dataVC?.deleteBtnPressed(dataVC?.deleteBtn as Any)
            // checking for the alert appear after successful deletion
            XCTAssertTrue(dataVC?.presentedViewController is UIAlertController)
            XCTAssertEqual(dataVC?.presentedViewController?.title, "Delete Successful")
            
            XCTAssertNotEqual(dataVC?.userName.text, currentUsername, "Delete Button Not Working")
            XCTAssertNotEqual(dataVC?.password.text, currentPassword, "Delete Button Not Working")
        }
        // now check delete button when no record found
        print(Model.shared.userArray.count)
        dataVC?.deleteBtnPressed(dataVC?.deleteBtn as Any)
        XCTAssertTrue(dataVC?.presentedViewController is UIAlertController)
        XCTAssertEqual(dataVC?.presentedViewController?.title, "Alert")
        
    }
    func testDataVcNextPreviousBtn(){
        var dataVC : DataViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        dataVC = storyboard.instantiateViewController(withIdentifier: "DataVC") as? DataViewController
        _ = dataVC?.view
        let currentUsername = dataVC?.userName.text!
        let currentPassword = dataVC?.password.text!
        dataVC?.nextBtnPressed(dataVC?.nextBtn as Any)
        XCTAssertEqual(dataVC?.userName.text, currentUsername, "Next Button Not Working")
        XCTAssertEqual(dataVC?.password.text, currentPassword, "Next Button Not Working")
        
        // now pressing the previous button
        dataVC?.previousBtnPressed(dataVC?.previousBtn as Any)
        XCTAssertEqual(dataVC?.userName.text, currentUsername, "Previous Button Not Working")
        XCTAssertEqual(dataVC?.password.text, currentPassword, "Previous Button Not Working")
    }
    
    func testAddUserVC(){
        var addUserVC : AddUserViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        addUserVC = storyboard.instantiateViewController(withIdentifier: "AddVC") as? AddUserViewController
        UIApplication.shared.keyWindow?.rootViewController = addUserVC
        _ = addUserVC?.view
        Model.shared.delegate = self
        let noOfUsers = Model.shared.userArray.count
            addUserVC?.userName.text = "\(noOfUsers + 1 )"
            addUserVC?.password.text = "password\(noOfUsers + 1)"
            addUserVC?.addbtnPressed(addUserVC?.addBtn as Any)
            // checking for alert appear for successful adding record
            XCTAssertTrue(addUserVC?.presentedViewController is UIAlertController)
           // XCTAssertEqual(addUserVC?.presentedViewController?.title, "Created")
            XCTAssertEqual(Model.shared.userArray.count, noOfUsers + 1, "New user not added")
        
    }
}


extension DataVNUnitTest: dataModelDelegate {
    
    func didRecieveDataUpdate(data: [User]) {
        print(data)
    }
    
    
}
