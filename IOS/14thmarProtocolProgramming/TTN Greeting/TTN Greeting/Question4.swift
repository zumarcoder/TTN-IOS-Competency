//
//  Question4.swift
//  TTN Greeting
//
//  Created by Akash Verma on 20/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Question4: UIViewController , ActivityIndicatorPresenter{
    
    var activityIndicator = UIActivityIndicatorView()

    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var question5Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        }
    @IBAction func onQuestion5ButtonClick(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Question5") as! Question5
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    @IBAction func onSwitchValueChanged(_ sender: Any) {
        if(switch1.isOn)
        {
           showActivityIndicator()
        }
        else
        {
            hideActivityIndicator()
        }
    }
    
    
    }


public protocol ActivityIndicatorPresenter {
    
    /// The activity indicator
    var activityIndicator: UIActivityIndicatorView { get }
    
    func showActivityIndicator()
    
    func hideActivityIndicator()
}

public extension ActivityIndicatorPresenter where Self: UIViewController {
    
    func showActivityIndicator() {
            self.activityIndicator.style = .whiteLarge
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height - 200 )
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
    }
}
