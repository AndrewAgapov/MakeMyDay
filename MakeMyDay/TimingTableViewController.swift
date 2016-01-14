//
//  TimingTableViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 10.11.15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit



class TimingTableViewController: UITableViewController, DatePikersViewControllerDelegate {
    
    var selectedTag: String = ""
    
    var arrayForTable : [String] = []
    
    var timeDict : [String:[String: NSDate]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"1234.png")!)
        print(arrayForTable)
        
    }
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.reloadData()
        self.navigationController?.navigationBarHidden = false
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayForTable.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! TableViewCell
        cell.lableOfCell.text = arrayForTable[indexPath.row]
        cell.myImage.image = DataManager.sharedInstance.selectedIcons[indexPath.row]
        
        let neededLable = arrayForTable[indexPath.row]
        var dict = timeDict[neededLable]
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        if (dict != nil){
            cell.lableFrom.text = dateFormatter.stringFromDate(dict!["from"]!)
            cell.lableTill.text = dateFormatter.stringFromDate(dict!["to"]!)
        }
        else {
            cell.lableFrom.text = ""
            cell.lableTill.text = ""
        }
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedTag = arrayForTable[indexPath.row]
        self.performSegueWithIdentifier("DatePikersViewController", sender: nil)
    }
    
    
    
    func datePickerViewController(controller: DatePikersViewController, dateFrom: NSDate, dateTill: NSDate) {
        timeDict[selectedTag] = ["from":dateFrom, "to":dateTill]
        DataManager.sharedInstance.timeDict = self.timeDict
        selectedTag = ""
        
    }
    


    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.destinationViewController.isKindOfClass(DatePikersViewController){
            let vc: DatePikersViewController = segue.destinationViewController as! DatePikersViewController
            vc.delegate = self
        }
        else {
            
        }
    }
    
    
    
}
