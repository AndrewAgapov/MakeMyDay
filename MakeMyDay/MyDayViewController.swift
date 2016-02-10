//
//  MyDayViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 11/19/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import Parse
class MyDayViewController: UIViewController {
    
    @IBOutlet weak var lableOfMyDay: UILabel!
    let dateFormater = NSDateFormatter()
    var dataLable: String?
    var dayForRecord = NSDate()
    
    var myTime = DataManager.sharedInstance.timeDict
    var myCases = DataManager.sharedInstance.selectedItems
    
    
    
    
    @IBAction func saveTheData(sender: AnyObject) {
        
    }
    
    func addRecord(cases : String, timeFrom:NSDate, timeTill:NSDate, day: NSDate){
        let record = PFObject(className: "MyDays")
        record["day"] = day
        record["timeFrom"] = timeFrom
        record["timeTill"] = timeTill
        record["cases"] = cases
        record.saveInBackground()
    }
    
    func makingDayForRecord() {
        let dateFormaterForRecord = NSDateFormatter()
        dateFormaterForRecord.dateFormat = "d MMMM yyyy, EEEE"
        dayForRecord = dateFormaterForRecord.dateFromString(dataLable!)!
        DataManager.sharedInstance.dayForRecord = self.dayForRecord
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"1234.png")!)
        lableOfMyDay.text = dataLable
        
        
        if myCases.count == myTime.count {
        
        for i in 0...myCases.count - 1{
            let currentCase = myCases[i]
            let currentTime = myTime[myCases[i]]
            let currentTimeFrom = currentTime!["from"]
            let currentTimeTill = currentTime!["to"]
            let diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: currentTimeFrom!, toDate: currentTimeTill!, options: NSCalendarOptions.init(rawValue: 0))
            let hoursDifference = diffDateComponents.hour * 60
            let minutesDifference = diffDateComponents.minute
            let differenceForGraph = Double(hoursDifference + minutesDifference) * 0.3
            dateFormater.dateFormat = "HHmm"
            let beginingTime = Double(dateFormater.stringFromDate(currentTimeFrom!))! / 6
            let frameOfMyCase = CGRect(x: 133, y: beginingTime, width: 200, height: differenceForGraph)
            let graphOfMyCase = UIView(frame: frameOfMyCase)
            if i % 2 == 0 {
                graphOfMyCase.backgroundColor = UIColor.brownColor()
            }
            else {
                graphOfMyCase.backgroundColor = UIColor(red: 128/255, green: 208/255, blue: 195/255, alpha: 1)
            }
            UIView.animateWithDuration(1, delay: 0.3, options: .BeginFromCurrentState, animations: { () -> Void in
                graphOfMyCase.center.x = graphOfMyCase.center.x - 120
                }, completion: nil)
            
            self.view.addSubview(graphOfMyCase)
            
            let label = UILabel(frame: CGRect(x: 140, y: beginingTime, width: 100, height:differenceForGraph))
            label.font = UIFont(name: label.font.fontName, size: 10)
            label.textAlignment = NSTextAlignment.Center
            label.text = currentCase
            UIView.animateWithDuration(1, delay: 1, options: .BeginFromCurrentState, animations: { () -> Void in
                label.center.x = label.center.x - 120
                }, completion: nil)
            self.view.addSubview(label)
            
            
            let myNotification = UILocalNotification()
            let dateformaterForNotification = NSDateFormatter()
            dateformaterForNotification.dateFormat = "d MMMM yyyy, EEEEHHmm"
            let timeTime = dateFormater.stringFromDate(currentTimeFrom!)
            let newDate = dataLable! + timeTime
            let timeForNotification = dateformaterForNotification.dateFromString(newDate)
            myNotification.alertBody = myCases[i]
            myNotification.fireDate = timeForNotification
            myNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
            makingDayForRecord()
            addRecord(myCases[i], timeFrom: currentTimeFrom!, timeTill: currentTimeTill!, day:dayForRecord)
            }
        }
        
        
    }
    
    
}
