//
//  ViewController.swift
//  Question1
//
//  Created by Akash Verma on 02/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var Button1 : UIButton!
    @IBOutlet var Button2 : UIButton!
    @IBOutlet var Label1 : UILabel!
    @IBOutlet var Label2 : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.text = "Welcome !"
        Label2.text = String("Wnat to Send on 5")
    }
    @IBAction func OnClick()
    {
        let storyBoard = UIStoryboard(name : "Main" , bundle : nil )
        let Controller = storyBoard.instantiateViewController(withIdentifier: "ViewController1")
        self.navigationController?.pushViewController(Controller , animated: true)
        print("you are in button")
    }
    @IBAction func onClick1()
    {
        let storyboard = UIStoryboard(name : "Main" , bundle : nil )
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController1")
        //self.navigationController?.pushViewController(controller , animated: true)
        self.present(controller, animated: true, completion: nil)
        print("you are in button1")
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
        print("view will appear view 0")
    }
}


