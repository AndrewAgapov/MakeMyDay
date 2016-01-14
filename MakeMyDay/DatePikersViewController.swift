//
//  DatePikersViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 15.11.15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit

protocol DatePikersViewControllerDelegate {
    func datePickerViewController(controller: DatePikersViewController, dateFrom: NSDate, dateTill:NSDate)
}

class DatePikersViewController: UIViewController {
    @IBOutlet weak var FirstDataPickerOutlet: UIDatePicker!
    @IBOutlet weak var SecondDataPickerOutlet: UIDatePicker!
    
    
    var delegate: DatePikersViewControllerDelegate! = nil
    
    var arrayForTable : [String] = []
    
    var timeFromArray : [String] = []
    
    var timeTillArray :[String] = []
    
    let dateFormatter = NSDateFormatter()
    
    @IBAction func didPressDone() {
        FirstDataPickerOutlet.maximumDate = NSDate()
        FirstDataPickerOutlet.maximumDate = NSDate()
        dateFormatter.dateFormat = "HH:mm"
        delegate.datePickerViewController(self, dateFrom:FirstDataPickerOutlet.date, dateTill: SecondDataPickerOutlet.date)
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"1234.png")!)
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewConroller = segue.destinationViewController as! TimingTableViewController
        destinationViewConroller.arrayForTable = arrayForTable
        
        
    }
    
    
}
