//
//  ThirdVC.swift
//  Question2
//
//  Created by Akash Verma on 27/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

let notificationIdentifier = "dataTransfer"

class ThirdVC: UIViewController {

    @IBOutlet weak var broadcastMessageTestField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onSendButtonTap(_ sender: Any) {
          print(broadcastMessageTestField.text!)
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationIdentifier) , object: self , userInfo: [1 : broadcastMessageTestField.text! ])
      
        self.navigationController?.popViewController(animated: true)
    }
    
}
