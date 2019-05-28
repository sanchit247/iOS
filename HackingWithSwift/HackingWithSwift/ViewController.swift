//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, StoryBoard {
   weak var coordinator: MainCoordinator?
    let dataSource = ProjectDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hacking with Swifts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = dataSource
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = dataSource.project(at: indexPath.row)
        coordinator?.show(project)
    }
    

}

