//
//  SecondVC.swift
//  Question2
//
//  Created by Akash Verma on 27/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var message2Label: UILabel!
    @IBOutlet weak var next2Button: UIButton!
    
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
        message2Label.text = "Message came from third controller : \(name)"
        
    }
    
//    @objc func fetchData()
//    {
//        print("in Second View Controller")
//        //work to do
//    }
    @IBAction func onNext2Click(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
