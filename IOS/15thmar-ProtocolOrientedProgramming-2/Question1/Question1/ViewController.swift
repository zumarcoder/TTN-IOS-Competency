//
//  ViewController.swift
//  Question1
//
//  Created by Akash Verma on 18/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate , loadable {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        loadNow()
    }

}

protocol loadable {
    func loadNow()
}

extension loadable where Self : UIScrollViewDelegate
{
    func loadNow()
    {
        print("Loading More")
    }
}
