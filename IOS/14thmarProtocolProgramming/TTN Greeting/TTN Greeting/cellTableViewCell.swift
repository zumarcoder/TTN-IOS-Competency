//
//  cellTableViewCell.swift
//  TTN Greeting
//
//  Created by Akash Verma on 21/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell , Roundable , Borderable{

    @IBOutlet var imageView1 : UIImageView!
    
    @IBOutlet var username1 : UILabel!
    
    @IBOutlet var email1 : UILabel!
    
    @IBOutlet var phonenumber1 : UILabel!
    
    @IBOutlet var employyeid1 : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundTheView(imageView: imageView1)
        applyBorder(imageView: imageView1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
