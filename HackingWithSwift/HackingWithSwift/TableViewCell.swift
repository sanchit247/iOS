//
//  TableViewCell.swift
//  HackingWithSwift
//
//  Created by sanchit on 28/05/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(attributedText : NSAttributedString){
        titleLabel.attributedText = attributedText
    }
}
