//
//  RoboListTableViewController.swift
//  ProjectRamu
//
//  Created by sanchit on 20/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class RoboListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoboIDCell", for: indexPath) as! RoboIDTableViewCell
        cell.bindData(id: "hello")
        return cell
    }


}
