//
//  TabBarControllerViewController.swift
//  RecipeApplication
//
//  Created by Akash Verma on 03/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class TabBarControllerViewController: UITabBarController
{
    @IBOutlet weak var logoutNavBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Will Don't let to Move on login Page after logging in.
    override func viewWillAppear(_ animated: Bool)
    {
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func onLogoutTap(_ sender: Any) {
            UserDefaults.standard.removeObject(forKey: "akash2808")
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func addButton(_ sender: Any)
    {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "EnteringDetails") as! EnteringDetails
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}
