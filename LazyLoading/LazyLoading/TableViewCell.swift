//
//  TableViewCell.swift
//  LazyLoading
//
//  Created by sanchit on 07/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(id:String , name : String){
        userIdLabel.text = id
        userNameLabel.text = name
    }
    

}
