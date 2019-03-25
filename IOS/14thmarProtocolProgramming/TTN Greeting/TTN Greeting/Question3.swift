//
//  Question3.swift
//  TTN Greeting
//
//  Created by Akash Verma on 20/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Question3: UIViewController , ErrorViewProtocol {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var animalLabel: UILabel!
    
    @IBOutlet weak var enterAnimalTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var Question4Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkForAnimal(_ sender: Any) {
    do
        {
            let abc = try self.checkTextField(errorMessage: enterAnimalTextField.text! ,  textfield : enterAnimalTextField )
            animalLabel.text = abc
        }
       catch
       {
        errorLabel.toastMessageLabel(message: "ohh itss Kiwi")
        }
        
    }
    @IBAction func onQuestion4Clickk(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Question4") as! Question4
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
enum errorPro1 : Error
{
    case notAnAnimal(String)
}

protocol ErrorViewProtocol : class {
    func checkTextField(errorMessage :String , textfield : UITextField ) throws -> String
}

extension ErrorViewProtocol where Self : UIViewController
{
    func checkTextField(errorMessage : String , textfield : UITextField)  throws -> String
    {
        if(textfield.text == "Kiwi")
        {
            throw errorPro1.notAnAnimal("Ohhhh its Kiwi Written there")
        }
        else
        {
            return errorMessage
        }
    }
}
