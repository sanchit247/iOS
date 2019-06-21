//
//  TableViewCell.swift
//  DemoApp
//
//  Created by mohit on 19/06/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgVIE: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    func bindData(img : UIImage){
        self.imgVIE.image = img
        
    }

}
