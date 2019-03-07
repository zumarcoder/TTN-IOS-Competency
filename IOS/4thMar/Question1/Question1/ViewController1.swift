//
//  ViewController1.swift
//  Question1
//
//  Created by Akash Verma on 02/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet var Button1 : UIButton!
    @IBAction func onClick()
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var Button2 : UIButton!
    @IBAction func onClick2()
    {
        
       // self.dismiss(animated: true, completion: nil)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Controller = storyBoard.instantiateViewController(withIdentifier: "ViewController2")
        self.navigationController?.pushViewController(Controller, animated: true)
        print("Button is pressed")
    }
    @IBOutlet var Label1 : UILabel!
    override func viewDidLoad() {
        Label1.text = "On 2nd View"
        super.viewDidLoad()
        print("view did load")
    }
    override func viewDidDisappear(_ animated: Bool ) {
        super.viewDidDisappear(true)
        print("view did Disappear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("view will Disappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("view will appear view 1")
    }

}
