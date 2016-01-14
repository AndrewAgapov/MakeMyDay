//
//  HomeViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 07.11.15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import Parse
class HomeViewController: UIViewController {
    var daysArray: [NSDate] = []
    let day = DataManager.sharedInstance.dayForRecord
    var sortedDays: [NSDate] = []
    
    func castOfDaysArray(){
        
        sortedDays = Array(Set(daysArray))
        print(sortedDays.count)
        print(sortedDays)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadInputViews()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"12345.png")!)
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
        
        let dateFormaterForRecord = NSDateFormatter()
        
        dateFormaterForRecord.dateFormat = "d MMMM yyyy, EEEE"
        dateFormaterForRecord.stringFromDate(day)
        
        
        let query = PFQuery(className: "MyDays")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        self.daysArray.append(object.valueForKey("day") as! NSDate)
                    }
                }
                
            } else {
                
                print("Error: \(error!) \(error!.userInfo)")
            }
            
            self.castOfDaysArray()
            
            
        }
        
        
        func viewWillAppear(animated: Bool) {
            self.navigationController!.navigationBarHidden = true
             
            
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(CallendarViewController){
        let destinationViewController = segue.destinationViewController as! CallendarViewController
        destinationViewController.sortedDays = sortedDays
        }
    }
    
    
}