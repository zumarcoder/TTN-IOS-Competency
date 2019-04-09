//
//  ViewController.swift
//  LocalizationApp
//
//  Created by Akash Verma on 09/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateofbirthLabel: UILabel!
    @IBOutlet weak var lottryLabel: UILabel!
    @IBOutlet weak var dateofbirthTextField: UITextField!
    @IBOutlet weak var lottrywonTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = NSLocalizedString("name", comment: "nameLabel")
        stateLabel.text = NSLocalizedString("state", comment: "stateLabel")
        countryLabel.text = NSLocalizedString("country", comment: "countryLabel")
        dateofbirthLabel.text = NSLocalizedString("dob", comment: "datepfbirthLabel")
        lottryLabel.text = NSLocalizedString("lottry", comment: "lottrylabel")
    }
}

