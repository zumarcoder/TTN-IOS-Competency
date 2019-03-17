//
//  ViewController.swift
//  Question1
//
//  Created by Akash Verma on 15/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profilepictureImageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var competencyTextField: UITextField!
    @IBOutlet weak var choosePictureButton: UIButton!
    @IBOutlet weak var submitButon: UIButton!
    @IBOutlet weak var subView : UIView!
    @IBOutlet weak var tableView : UITableView!
    
    struct  employeeData {
        let image : UIImage
        let name : String
        let address : String
        let age : String
        let competency : String
        let phno : String
    }
    
    var employeeDataArray = [employeeData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        let nib = UINib.init(nibName: "cellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "xibcell1")
        subView.isHidden = true
    }
    
    @IBAction func onSubmitButtonClick()
    {
        employeeDataArray.append(employeeData(image : profilepictureImageView.image! ,name: nameTextField.text!, address: addressTextField.text!, age: ageTextField.text! , competency: competencyTextField.text! , phno: phoneTextField.text! ))
            subView.isHidden = false
            tableView.reloadData()
            self.view.bringSubviewToFront(subView)
    }
    
    @IBAction func onChooseImageButtonClick(_ sender : Any)
    {
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
        
        profilepictureImageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCloseButtonClick()
    {
        subView.isHidden = true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return employeeDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "xibcell1") as! cellTableViewCell
        
        cell.profileImageView.image = employeeDataArray[indexPath.row].image
        cell.nameLabel.text = employeeDataArray[indexPath.row].name
        cell.ageLabel.text = employeeDataArray[indexPath.row].age
        cell.phnoLabel.text = employeeDataArray[indexPath.row].phno
        cell.addressLabel.text = employeeDataArray[indexPath.row].address
        cell.competencyLabel.text = employeeDataArray[indexPath.row].competency
        return cell
    }
}

