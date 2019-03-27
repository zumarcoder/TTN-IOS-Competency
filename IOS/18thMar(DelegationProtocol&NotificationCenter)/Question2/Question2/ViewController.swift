//
//  ViewController.swift
//  Question2
//
//  Created by Akash Verma on 27/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var message1Label: UILabel!
    @IBOutlet weak var next1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notificationIdentifier), object: nil, queue: nil, using: fetchData)
    }
    func fetchData(notification : Notification)
    {
        guard let name = notification.userInfo![1]
            else {
                return
        }
        message1Label.text = "Message came from third controller : \(name)"
        
    }
    @objc func fetchData()
    {
        print("in first View Controller")
    }
    
    @IBAction func nextButtonOnClick(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.navigationController?.pushViewController(controller, animated: true)
    
    }
    
    
    
}

