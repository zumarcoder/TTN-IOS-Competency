//
//  EmployeeSegment.swift
//  SignUp
//
//  Created by Akash Verma on 12/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class EmployeeSegment: UIViewController {
    @IBOutlet weak var employeeSegmentControl: UISegmentedControl!
    @IBOutlet weak var selectedSegmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSegmentLabel.text = "Employee is the selected Segment"
        // Do any additional setup after loading the view.
    }
    @IBAction func changeScreen(_ sender: Any) {
        if(employeeSegmentControl.selectedSegmentIndex == 0)
        {
            selectedSegmentLabel.text = "Employee segment selected";
        }
        else  {
            selectedSegmentLabel.text = "Employer segment selected";
        }
    }
}
