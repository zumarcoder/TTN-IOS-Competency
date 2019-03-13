//
//  ViewController.swift
//  question1
//
//  Created by Akash Verma on 13/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterSectionLabel: UITextField!
    var imageHoldingStackView = UIStackView()
    var horizontalStackView1 = UIStackView()
    var horizontalStackView2 = UIStackView()

    
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addImagesMethod()
    {
        
        let gotValue = String(enterSectionLabel.text!)
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        
        if(gotValue == "1"){
            imageHoldingStackView = UIStackView(arrangedSubviews: [redView])
            
        }

        else if(gotValue == "2"){
            imageHoldingStackView = UIStackView(arrangedSubviews: [redView , blueView])

        }
        else if (gotValue == "3")
        {
              imageHoldingStackView = UIStackView(arrangedSubviews: [redView , blueView , yellowView])
        }
        
        else if (gotValue == "4")
        {
        imageHoldingStackView = UIStackView(arrangedSubviews: [horizontalStackView1 , horizontalStackView2])
            
            horizontalStackView1 = UIStackView(arrangedSubviews: [redView  , orangeView])
            horizontalStackView2 = UIStackView(arrangedSubviews: [yellowView  , blueView])
            
            
            horizontalStackView1.axis = .horizontal
            horizontalStackView1.distribution = .fillEqually
            horizontalStackView2.axis = .horizontal
            horizontalStackView2.distribution = .fillEqually
            horizontalStackView1.frame = CGRect(x: 0, y: 0, width: imageHoldingStackView.bounds.size.width, height: imageHoldingStackView.bounds.size.height)
            horizontalStackView2.frame = CGRect(x: 0, y: 0, width: imageHoldingStackView.bounds.size.width, height: imageHoldingStackView.bounds.size.height)

        }
        imageHoldingStackView.axis = .vertical
        imageHoldingStackView.distribution = .fillEqually
        
        view.addSubview(imageHoldingStackView)
        imageHoldingStackView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200)
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

