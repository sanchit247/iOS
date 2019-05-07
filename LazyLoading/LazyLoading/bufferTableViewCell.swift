//
//  bufferTableViewCell.swift
//  LazyLoading
//
//  Created by sanchit on 07/05/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class bufferTableViewCell: UITableViewCell {

    @IBOutlet weak var buffer: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
