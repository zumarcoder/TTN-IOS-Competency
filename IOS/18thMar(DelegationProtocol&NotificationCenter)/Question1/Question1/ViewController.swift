//
//  ViewController.swift
//  Question1
//
//  Created by Akash Verma on 26/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DictionaryPassable {
   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phnoLabel: UILabel!
    @IBOutlet weak var enterDetailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onEnterDetailsTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DictionaryPassControlView") as! DictionaryPassControlView
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func passDictionary(dictionary: [String : String]) {
        nameLabel.text = "Name : \(dictionary["Name"]!)"
        ageLabel.text = "Age : \(dictionary["Age"]!)"
        phnoLabel.text = "Phone Number : \(dictionary["PhoneNumber"]!)"
    }
}

