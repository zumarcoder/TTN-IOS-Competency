//
//  PopupImage.swift
//  Gallery
//
//  Created by Akash Verma on 07/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class PopupImage: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondaryHiddenView: UIView!
    @IBOutlet weak var authornameLabel: UILabel!
    @IBOutlet weak var authorUrlLabel: UILabel!
    @IBOutlet weak var postUrlLabel: UILabel!
    @IBOutlet weak var navBar: CustomizedNavBar!
    
    
    
    var authorname = ""
    var authorUrl = ""
    var posturl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        authornameLabel.text = authorname
        authorUrlLabel.text = authorUrl
        postUrlLabel.text = posturl
        navBar.backButton.addTarget(self, action: #selector(goback), for: .touchUpInside)
    }
    @objc func goback(){
       
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onDownloadButtonTap(_ sender: Any) {
    }
    @IBAction func onAuthorButtonTap(_ sender: Any) {
        secondaryHiddenView.isHidden = false
    }
    @IBAction func onDoneButtonTap(_ sender: Any) {
        secondaryHiddenView.isHidden = true
    }
    @IBAction func onAuthorProfileTap(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: authorUrl)! as URL)
    }
}
