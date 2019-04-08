//
//  ViewController.swift
//  cocoapodscheck
//
//  Created by Akash Verma on 22/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//
import Reachability
import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var prinitngStatius  = isInternetAvailable()
        print(prinitngStatius)
    }
    
        func isInternetAvailable() -> Bool {
            
            
            var reach = Reachability.Connection.self
        
            let reachability: Reachability = Reachability(hostname: "www.google.com")!
            let networkStatus = reachability.connection
            
            print(networkStatus)
            if networkStatus == .none {
                return false
            } else {
                return true
            }
        }

}

