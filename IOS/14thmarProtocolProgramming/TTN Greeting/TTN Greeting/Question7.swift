//
//  Question7.swift
//  TTN Greeting
//
//  Created by Akash Verma on 21/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Question7: UIViewController , LoggableProtocol , UINavigationControllerDelegate , UIImagePickerControllerDelegate
    , Roundable , Borderable , validator 
    
{
  
    @IBOutlet weak var validationMessageLabel : UILabel!
    
    @IBOutlet weak var viewHiddenView : UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var changeImageButton: UIButton!
    
    @IBOutlet weak var usernameSignupTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var employeeidTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var passwordSignupTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var usernmaeloginTextField: UITextField!
    
    @IBOutlet weak var passwordloginTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var backButton : UIButton!
    
    struct signupDetails {
        var profilePicture : UIImage
        var username : String?
        var email : String?
        var phoneNumber : String?
        var employeeid : String?
        var password : String?
    }
    
    var signupdetailsArray = [signupDetails]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "cellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "xibcell1")
        roundTheView(imageView: profilePictureImageView) // this is a protocol based method defined in the Question6 Class
        
        viewHiddenView.layer.borderWidth = 5.0
    }
    
    @IBAction func emailTextEditCheck()
    {
        let conditionn = emailValidation(email: emailTextField.text!)
        if(conditionn == false)
        {
            print(false)
            validationMessageLabel.toastMessageLabel(message: "Incorrect Email format" )
        }
    }
    @IBAction func passwordTextEditCheck()
    {
        let conditionn = passwordValidation(password: passwordSignupTextField.text!)
        if(conditionn == false)
        {
            print(false)
            validationMessageLabel.toastMessageLabel(message: "Password Format error : Atleast 1 Alphabet and 1 number and 1 character with total length 8" )
        }
    }
    
    @IBAction func onChangeImageButtonClick(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let selectPicture = UIAlertController(title: "Upload Image", message: "Select the Source", preferredStyle: .actionSheet)
        
        selectPicture.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action : UIAlertAction) in imagePickerController.sourceType = .camera
            self.present(selectPicture , animated: true, completion: nil)
        }))
        
        selectPicture.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(action : UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        selectPicture.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        self.present(selectPicture, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        profilePictureImageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSignupButtonClick(_ sender: Any) {
        let temporaryStruct = signupDetails(profilePicture: profilePictureImageView.image!, username: usernameSignupTextField.text!, email: emailTextField.text!, phoneNumber: phoneTextField.text!, employeeid: employeeidTextField.text!, password: passwordSignupTextField.text!)
        signupdetailsArray.append(temporaryStruct)
//        UserDefaults.standard.set( passwordSignupTextField.text! , forKey: usernameSignupTextField.text!)
        addUser(userName: [ passwordSignupTextField.text!] , key: usernameSignupTextField.text! )
//        print(UserDefaults.standard.array(forKey: usernameSignupTextField.text! )! )
        
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        let passwordcheckup = UserDefaults.standard.array(forKey: usernmaeloginTextField.text! )!
        let passwordcheckuptoString : String = (passwordcheckup[0] as! String)
        if(passwordloginTextField.text! == passwordcheckuptoString)
        {
         viewHiddenView.isHidden = false
            tableView.reloadData()
        }
    }
    
    @IBAction func onBackButtonClick()
    {
        viewHiddenView.isHidden = true
    }
    
}
extension Question7 : UITableViewDataSource , UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signupdetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xibcell1") as! cellTableViewCell
        var temporary = signupdetailsArray[indexPath.row]
        cell.username1.text = temporary.username!
        cell.email1.text = temporary.email!
        cell.employyeid1.text = temporary.employeeid!
        cell.imageView1.image = temporary.profilePicture
        cell.phonenumber1.text = temporary.phoneNumber!
        return cell
    }
}
protocol validator {
    func passwordValidation(password : String) -> Bool
    func emailValidation(email : String) -> Bool
}
extension validator
{
    func passwordValidation(password : String) -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    func emailValidation(email : String) -> Bool
    {
        
       let emailRegEx = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailRegEx.evaluate(with: email)
    }
}
