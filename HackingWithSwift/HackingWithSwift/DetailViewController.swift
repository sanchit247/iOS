//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , StoryBoard {
    var project: Project!
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(project != nil, "You must set a project before show this view controller.")
        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.number)"
    }
    
    func readProject() {
       coordinator?.read(project)
    }
    override func loadView() {
        view = DetailView(project: project, readAction: readProject)
    }
}
