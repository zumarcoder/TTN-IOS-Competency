//
//  ViewController4.swift
//  Question1
//
//  Created by Akash Verma on 02/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    @IBOutlet var Label1 : UILabel!
    @IBOutlet var Button1 : UIButton!
    @IBOutlet var Button2 : UIButton!
    @IBOutlet var Button3 : UIButton!
    @IBAction func onClick1 ()
    {
        self.navigationController?.popToRootViewController(animated: true) // it will send to the home or root of the application
    }
    
    @IBAction func onClick2 ()
    {
        let nabArray = self.navigationController?.viewControllers
        let mover = nabArray![2]
        self.navigationController?.popToViewController(mover, animated: true) // for sending to any specific viewController by poping out all the view controllers from the stack till that viewController
    }
    
    @IBAction func onClick3 ()
    {
        self.navigationController?.popViewController(animated: true) // to pop out the initial state
    }
    override func viewDidLoad() {
        super.viewDidLoad()
Label1.text = "You are on ViewController 5"
    }
}
