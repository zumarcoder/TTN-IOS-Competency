//
//  Login.swift
//  RecipeApplication
//
//  Created by Akash Verma on 02/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Login: UIViewController
{

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad()
    {
            super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "akash2808"))
        {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "TabBarControllerViewController") as! TabBarControllerViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
   
    @IBAction func onSigninButtonClick(_ sender: Any)
    {
        UserDefaults.standard.set(true, forKey: usernameTextField.text! )
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "TabBarControllerViewController") as! TabBarControllerViewController
            self.navigationController?.pushViewController(controller, animated: true)
    }
}
