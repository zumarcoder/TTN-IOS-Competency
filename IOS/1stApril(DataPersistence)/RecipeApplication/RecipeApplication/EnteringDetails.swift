//
//  EnteringDetails.swift
//  RecipeApplication
//
//  Created by Akash Verma on 02/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import CoreData

class EnteringDetails: UIViewController , SavingDataToDB
{
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var madeByTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var timeDurationTextField: UITextField!
    @IBOutlet weak var ingrediantsTextField: UITextField!
    @IBOutlet weak var Commit: UIButton!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var favoriteValue = true
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func onCommitButtonTap(_ sender: Any)
    {
        // add data is defined in the ProtocolsFile
        addData(name: recipeNameTextField.text!, origin: originTextField.text!, favorite: favoriteValue, timeToPrep: timeDurationTextField.text!, madeBy: madeByTextField.text!, ingrediant: ingrediantsTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onFavoriteSwitchChange(_ sender: Any)
    {
    if(favoriteSwitch.isOn)
    {
        favoriteValue = true
        }
        else
    {
        favoriteValue = false
        }
        
    }
    @IBAction func onCancelButtonTap(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
