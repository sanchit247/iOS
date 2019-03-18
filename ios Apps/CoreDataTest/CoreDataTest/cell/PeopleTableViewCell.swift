//
//  PeopleTableViewCell.swift
//  CoreDataTest
//
//  Created by sanchit on 11/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

   
    @IBOutlet weak var personNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    func bindData(name:String){
        self.personNameLabel.text = name
    }
}
