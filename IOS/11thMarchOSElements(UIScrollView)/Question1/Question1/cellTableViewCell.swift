//
//  cellTableViewCell.swift
//  Question1
//
//  Created by Akash Verma on 16/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    
    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var phnoLabel : UILabel!
    @IBOutlet var competencyLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var ageLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
