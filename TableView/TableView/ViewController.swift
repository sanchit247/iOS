//
//  ViewController.swift
//  TableView
//
//  Created by sanchit on 01/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var tableData : [Int :[String: [String : String]]] = [0 : ["lion" :["LION" : "0123456789"]] , 1 :["elephant" : ["ELEPHANT" : "4455778899"]], 2 :["panda": ["PANDA" : "9874587450"]], 3 : ["tiger" :["TIGER" : "89775454536"]]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
   
    // MARK: TableView Delegates and datasources
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let alert = UIAlertController(title: "DELETE CONTACT", message: "Are you sure want to delete?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "DELETE !", style: .default, handler: { (UIAlertAction) in
                self.deleteRecord(index : indexPath.row)
            })
            alert.addAction(deleteAction)
            present(alert, animated: true, completion: nil)
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        
        let rowData = tableData[indexPath.row]!
        
        let imageName = Array(rowData)[0].0
        let otherData = Array(rowData)[0].1
        
        let nameLabel = Array(otherData)[0].0
        let contactLabel = Array(otherData)[0].1
        
        
        
        cell.cellImage?.image = UIImage(named: imageName)
        cell.nameLabel?.text = nameLabel
        cell.contactLabel?.text = contactLabel

        return cell
        
    }
    
    
    func deleteRecord(index : Int){
        tableData.removeValue(forKey: index)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
        print(tableData)
    }


}

