//
//  CustomizedNavBar.swift
//  Gallery
//
//  Created by Akash Verma on 08/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import Foundation
import UIKit

class CustomizedNavBar: UIView {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var optionBar: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.configureNavBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
                self.configureNavBar()
    }
    
    func configureNavBar()
    {
        let bundle = Bundle(for: (type(of: self)) )
        let nib = UINib(nibName: "CustomizedNavBar" , bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            self.addSubview(view)
            self.backButton.roundCorner(cornerRadiuss: self.backButton.frame.height/2, maskRadiuss: [.layerMinXMinYCorner , .layerMinXMaxYCorner])
            
            self.optionBar.roundCorner(cornerRadiuss: self.optionBar.frame.height/2, maskRadiuss : [.layerMaxXMaxYCorner , .layerMaxXMinYCorner])
            
            self.titleLabel.roundCorner(cornerRadiuss: self.titleLabel.frame.height/2, maskRadiuss: [.layerMaxXMaxYCorner , .layerMaxXMinYCorner,  .layerMinXMaxYCorner, .layerMinXMinYCorner])
        }
    }
}
