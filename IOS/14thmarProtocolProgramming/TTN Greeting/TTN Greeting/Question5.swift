//
//  Question5.swift
//  TTN Greeting
//
//  Created by Akash Verma on 20/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Question5: UIViewController , LoggableProtocol {

    
    
    @IBOutlet weak var loginStatusLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var question6Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    
    
    @IBAction func onQuestion6Click(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Question6") as! Question6
            self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func onSignupClick(_ sender: Any) {
       
        removeuser(userName: usernameTextField.text!)
        loginStatusLabel.text = "Login"
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        addUser(userName: [ usernameTextField.text! ], key: usernameTextField.text!)
        let username1 = UserDefaults.standard.array(forKey: usernameTextField.text!)
        loginStatusLabel.text = "Welcome ! \(username1![0])"
    }
    
}

protocol LoggableProtocol  {
    
    func addUser(userName : [String] ,  key : String)
    func removeuser(userName : String)
    
}

extension LoggableProtocol
{
    func addUser(userName : [String] , key : String)
    {
        UserDefaults.standard.set(userName, forKey: key )
    }
    
    func removeuser(userName : String)
    {
        UserDefaults.standard.removeObject(forKey: userName )

    }
}
