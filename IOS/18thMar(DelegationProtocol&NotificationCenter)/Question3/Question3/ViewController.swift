//
//  ViewController.swift
//  Question3
//
//  Created by Akash Verma on 27/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController , UNUserNotificationCenterDelegate {
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    let time = Date()
    let user = UNUserNotificationCenter.current()
    
    
    @IBOutlet weak var notifyMeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Click to Triger Notification"
        checkRegister()
    }

    @objc func checkRegister(){
        user.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(granted,error) in
            if granted {
                print("Success")
                
            } else{
                print("Failure")
            }
        })
    }
    
    
    @IBAction func onNotifyButtonClick(_ sender: Any) {
        label.text = "Notification Done"
        user.removeAllPendingNotificationRequests()
        toRegisterSection()
        let content = UNMutableNotificationContent()
        content.title = "Warning!!!!!"
        content.body = "This is the warning message"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "plucky.m4r"))
        let calendar = Calendar.current
        var arrayTime = [String]()
        arrayTime = (timeTextField.text?.components(separatedBy: ":"))!
        let hours = Int(arrayTime[0])
        let minutes = Int(arrayTime[1])
        //print(hours , minutes )
        let components = DateComponents(year: 2019, month: 03, day: 27, hour: hours!, minute: minutes!) // Set the date here when you want Notification
        let date = calendar.date(from: components)
        let comp2 = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: date!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comp2, repeats: false)
        let request = UNNotificationRequest(identifier:UUID().uuidString , content:content , trigger: trigger)
        user.add(request)
        
    
    }
    func toRegisterSection(){
        user.delegate = self
    }
}


/*
let time = Date()
let user = UNUserNotificationCenter.current()
let time = Date()
let user = UNUserNotificationCenter.current()
@IBOutlet weak var notificationLabel: UILabel!

@IBOutlet weak var notificationTextField: UITextField!
@IBOutlet weak var notificationButton: UIButton!
override func viewDidLoad() {
    super.viewDidLoad()
    notificationLabel.text = "Click to Notify"
    checkRegister()
}
@objc func checkRegister(){
    user.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(granted,error) in
        if granted {
            print("Success")
            
        } else{
            print("Failure")
        }
    })
}


@IBAction func notificationAction(_ sender: Any) {
    notificationLabel.text = "Notification Done"
    user.removeAllPendingNotificationRequests()
    toRegisterSection()
    let content = UNMutableNotificationContent()
    content.title = "Warning!!!!!"
    content.subtitle = "\(time)"
    
    content.body = "This is the warning message"
    content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "definite.m4r"))
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
    let request = UNNotificationRequest(identifier:UUID().uuidString , content:content , trigger: trigger)
    user.add(request)
    
}


func toRegisterSection(){
    user.delegate = self
}


*/
