//
//  CallendarViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 11/30/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import Parse

class CallendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sortedDays = []
    var timeFrom:[NSDate] = []
    var timeTill:[NSDate] = []
    var cases:[String] = []
    var casesWithTime: [String: [String : NSDate]] = [:]
    var arrayForCasesAndTime: [Int : [String: [String : NSDate]]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        for i in 0...sortedDays.count - 1 {
            
            let query = PFQuery(className:"MyDays")
            query.whereKey("day", equalTo: sortedDays[i])
            
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    
                    if let objects = objects {
                        for object in objects {
                            
                            self.timeFrom.append(object["timeFrom"] as! NSDate)
                            self.timeTill.append(object["timeTill"] as! NSDate)
                            self.cases.append(object["cases"] as! String)
                            
                            
                            self.casesWithTime[object["cases"]as! String] = ["from":object["timeFrom"] as! NSDate, "to":object["timeTill"] as! NSDate]
                            
                            self.arrayForCasesAndTime[i] = self.casesWithTime
                            print(object)
                            
                            
                            
                            
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
                
                
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedDays.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Celll", forIndexPath: indexPath) as! CallendarCollectionViewCell
        let dateFormaterForRecord = NSDateFormatter()
        dateFormaterForRecord.dateFormat = "d MMMM yyyy, EEEE"
        cell.lable.text = dateFormaterForRecord.stringFromDate(sortedDays[indexPath.row] as! NSDate)
        
        return cell
        
    }
        
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    
    
    
    
    
}
