//
//  TableViewCell.swift
//  StopWatch
//
//  Created by Akash Verma on 19/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var label1 : UILabel!
    @IBOutlet var label2 : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setLabel(value:Any){
        label1.text = " \(value)"
    }
    
}
