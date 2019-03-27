//
//  FirstTableViewCell.swift
//  TableView
//
//  Created by sanchit on 01/02/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//  func bindData(img : String , name : String , phoneNo : String ) {
//    self.cellImage = img
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
