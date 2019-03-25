//
//  Question6.swift
//  TTN Greeting
//
//  Created by Akash Verma on 21/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class Question6: UIViewController , Roundable , Borderable {
    
    
  //  var imageView = UIImageView()
    @IBOutlet weak var question7Button: UIButton!
    
    @IBOutlet weak var redImageView: UIImageView!
    
    @IBOutlet weak var blueImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheView(imageView : redImageView)
        applyBorder(imageView: redImageView)
        
        roundTheView(imageView : blueImageView)
        applyBorder(imageView: blueImageView)
    }
    
    @IBAction func onQuestion7Click(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Question7") as! Question7
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

protocol Roundable {
    //var imageView: UIImageView { get }
    func roundTheView(imageView : UIImageView)
}
extension Roundable
{
    func  roundTheView(imageView : UIImageView){
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
    
    }
}

protocol Borderable {
    func applyBorder(imageView : UIImageView)
}
extension Borderable
{
    func applyBorder(imageView : UIImageView)
    {
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2.0
    }
}


