//
//  DictionaryPassControlView.swift
//  Question1
//
//  Created by Akash Verma on 26/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

protocol DictionaryPassable {
    func passDictionary(dictionary : [ String : String ] )
}


class DictionaryPassControlView: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextEdit: UITextField!
    @IBOutlet weak var phnumTextEdit: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var delegate : DictionaryPassable?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func onSubmitButtonClick(_ sender: Any) {
        
        var dictionary1 = [String : String]()
        if delegate != nil {
            dictionary1.updateValue(nameTextField.text!, forKey: "Name")
            dictionary1.updateValue(ageTextEdit.text!, forKey: "Age")
            dictionary1.updateValue(phnumTextEdit.text!, forKey: "PhoneNumber")
            delegate?.passDictionary(dictionary: dictionary1)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
