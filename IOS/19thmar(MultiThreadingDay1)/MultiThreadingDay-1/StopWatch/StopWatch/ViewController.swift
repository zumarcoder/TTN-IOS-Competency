//
//  ViewController.swift
//  StopWatch
//
//  Created by Akash Verma on 19/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    

    var timer = Timer()
    var timesec = 0
    var timemin = 0
    var labelStringArray = [String]()
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var lapButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tablecell")
        resetButton.clipsToBounds = true
            resetButton.layer.cornerRadius = 0.5 * resetButton.bounds.size.width
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        lapButton.clipsToBounds = true
        lapButton.layer.cornerRadius = 0.5 * lapButton.bounds.size.width
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelStringArray.count
        //return 10
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! TableViewCell
        
        //cell.label1.text = labelStringArray[indexPath.row]
        cell.setLabel(value: labelStringArray[indexPath.row])
        cell.label2.text = "Lap \(labelStringArray.count - indexPath.row)"
        //cell.label1.text = timeLabel.text!
        return cell
    }
    
    @IBAction func onLapButtonClick()
    {
        
        if((timeLabel.text!) != "00:00")
            {
            DispatchQueue.main.async {
            self.labelStringArray.insert(self.timeLabel.text!, at: 0)
            self.tableView.reloadData()
            print(self.labelStringArray)
            
            }
            }
        

    }
    
    
    @objc func incrementTimer() {
        if(timesec < 9)
        {
        timesec += 1
        timeLabel.text = "0"+String(timemin)+":0"+String(timesec)
        if(timesec == 59) {
            timesec = 0
            timemin += 1
          }
        }
        else
            {
                timesec += 1
                timeLabel.text = "0"+String(timemin)+":"+String(timesec)
                if(timesec == 59)
                {
                    timesec = 0
                    timemin += 1
                }
            }

        
        
        
        }
    
@IBAction func onStartClick()
{
 timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
    startButton.isEnabled = false

}
    
    @IBAction func pauseButton(_ sender: Any) {
        timeLabel.text = "00:00"
        timer.invalidate()
        timesec = 0
        timemin = 0
        labelStringArray = []
        tableView.reloadData()
        startButton.isEnabled = true
    }
    

}
//protocol buttonAtributes
//{
//    func round()
//    func greycolor()
//}
//extension UIButton : buttonAtributes
//{
//    func round() {
//        self.clipsToBounds = true
//        self.layer.cornerRadius = 0.5 * self.bounds.size.width
//    }
//
//    func greycolor() {
//        self.setTitleColor(.red , for: .normal)
//    }
//}
