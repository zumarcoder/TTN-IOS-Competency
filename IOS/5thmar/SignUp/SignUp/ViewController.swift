//
//  ViewController.swift
//  SignUp
//
//  Created by Akash Verma on 05/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    
    
    @IBOutlet var userName : UITextField!
    @IBOutlet var email : UITextField!
    @IBOutlet var phNum : UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var dob : UITextField!
    @IBOutlet var place : UITextField!
    @IBOutlet var switch1 : UISwitch!
    @IBOutlet var labelswitch : UILabel!
    @IBOutlet var signupbutton : UIButton!
    
    let picker = UIDatePicker() // for date picker view
    
    let birthplaces = ["Delhi","Ghaziabad","Noida","Kanpur","Uttrakhand","Kashmir"]
    //array to insert in picker view
    
    
    var selectedcity : String? // for temporar varibale in extention's function
   
    override func viewDidLoad() {
        super.viewDidLoad()
        createtoolbar() // will call the date picker with done button
        createPlacePicker() // will call the pickerview only
        createplacepickerobj() // will put done button in picker view
        signupbutton.isEnabled = false
        [userName,phNum,password,dob,place].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }

    func createtoolbar() // function for date picker
{
    let toolvar = UIToolbar()
    toolvar.sizeToFit()
    let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.showdate))
    toolvar.setItems([done], animated: false)
    dob.inputAccessoryView = toolvar
    dob.inputView = picker
    picker.datePickerMode = .date
    }
  
    @objc func showdate() // will show or will return back the date in string form
{
    let dateformat = DateFormatter()
    dateformat.dateFormat = "yyyy-mm-dd"
    let dateis = dateformat.string(from: picker.date)
    dob.text = dateis
    self.view.endEditing(true)
    }
    
    func createPlacePicker() // this will create the done button on the pickerview
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let donebutton = UIBarButtonItem(title: "done", style: .plain, target: nil, action: #selector(self.dismiskeyboard))
        toolbar.setItems([donebutton], animated: false)
        toolbar.isUserInteractionEnabled = true
        place.inputAccessoryView = toolbar
    }
    @objc func dismiskeyboard() // to dismmiss the keyboard
    {
        view.endEditing(true)
    }
    func createplacepickerobj() // create the picker view on clicking the textbox names as place
    {
        let placepicker = UIPickerView()
        placepicker.delegate = self
        
        place.inputView = placepicker
    }
    
}

extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate
    // conforming the protocola in extention so the its methods can be used further
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int { // total number of column needed to be sellected
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // total number of columns needed to populate
        return birthplaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //shows the title of the data
        return birthplaces[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // will place the string on the text box on changing the values
        selectedcity = birthplaces[row]
        place.text = selectedcity
    }
    
    
    
    @IBAction func onSignup() // button is not working
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Controller = storyboard.instantiateViewController(withIdentifier: "ProfilePictureController")
        self.navigationController?.pushViewController(Controller , animated: true)
    }
    
    @IBAction func onChange() // changes the text in label
    {
        if(switch1.isOn)
        {
            labelswitch.text = "Private Account"
        }
        if(!switch1.isOn)
        {
            labelswitch.text = "Public Account"
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) { // enables button when all the text fields are edited.
       
        if (userName.text!.isEmpty) || (email.text!.isEmpty) || (phNum.text!.isEmpty) || (dob.text!.isEmpty) || (password.text!.isEmpty)  {
            signupbutton.isEnabled = false
        }else {
            signupbutton.isEnabled = true
        }
        
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let nextTag = textField.tag + 1
//
//        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
//            nextResponder.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//
//        return true
//    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool{
     if  textField == userName
     {
        email.becomeFirstResponder()
        }
        if  textField == email
     {
        phNum.becomeFirstResponder()
        }
        return true
    }
    
    
    
}
