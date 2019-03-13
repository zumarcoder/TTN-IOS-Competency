//
//  ViewController.swift
//  Question3
//
//  Created by Akash Verma on 13/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainVerticalStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: mainVerticalStackView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainVerticalStackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainVerticalStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainVerticalStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
     
    }

    

}

