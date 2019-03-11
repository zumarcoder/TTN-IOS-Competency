//
//  ViewController.swift
//  Question2
//
//  Created by Akash Verma on 10/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageview1 : UIImageView!
    @IBOutlet var button1 : UIButton!
    
    @IBAction func roundImageClick()
    {
        self.imageview1.clipsToBounds = true
        self.imageview1.layer.cornerRadius = 120
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

