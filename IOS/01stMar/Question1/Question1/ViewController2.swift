//
//  ViewController2.swift
//  Question1
//
//  Created by Akash Verma on 02/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var Button1 : UIButton!
    @IBOutlet var Label1 : UILabel!
    @IBAction func OnClick1 ()
    {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let Controller = StoryBoard.instantiateViewController(withIdentifier: "ViewController3")
        self.navigationController?.pushViewController(Controller, animated: true)
    }
    override func viewDidLoad() {
        Label1.text = "On 3rd View"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
