//
//  ViewController.swift
//  TTN Greeting
//
//  Created by Akash Verma on 20/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//Question 1 and Question 2
    
    @IBOutlet weak var Question3Button: UIButton!
    @IBOutlet var dateTextField : UITextField!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var submitButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onQuestionButtonClick(_ sender : Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "Question3") as! Question3
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    @IBAction func onButtonClick()
    {
            let dateString = dateTextField.text!
            let (day , month , year ) = Date.takeDate(DateString: dateString)
            print(day , month , year )
            let datefullString = "Date : \(day) Month : \(month) Year : \(year)"
            dateLabel.toastMessageLabel(message: datefullString)
    }
}


extension Date
{
    static func takeDate(DateString : String) -> (String , String , String)
    {
        var array = [String]()
        array = DateString.components(separatedBy: "/")
        let day = array[0]
        let month = array[1]
        let year = array[2]
        
        return (day , month , year)
    }
}

protocol Toastable {
    func toastMessageLabel(message : String)
}

extension UILabel : Toastable
{
    
    func toastMessageLabel(message: String)  {
        self.isHidden = false
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font = UIFont(name: "Montserrat-Light", size: 12.0)
        self.text = message
        self.alpha = 1.0
        self.layer.cornerRadius = 10
        self.clipsToBounds  =  true
        UIView.animate(withDuration: 6.0, delay: 0.1, options: .curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: {(isCompleted) in
            self.isHidden = true
        })
    }
}
