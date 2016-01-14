//
//  SetTheDayViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 11/19/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit

class SetTheDayViewController: UIViewController {
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var dateLable: UILabel!
    let dateFormater = NSDateFormatter()
    


    override func viewDidLoad() {
                super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"1234.png")!)
        dateFormater.dateFormat = "d MMMM yyyy, EEEE"
        dataPicker.datePickerMode = UIDatePickerMode.Date
        dateLable.text = dateFormater.stringFromDate(dataPicker.date)
        
            }

    @IBAction func choosingDate(sender: AnyObject) {
        
        dateFormater.dateFormat = "d MMMM yyyy, EEEE"
        dataPicker.datePickerMode = UIDatePickerMode.Date
        dateLable.text = dateFormater.stringFromDate(dataPicker.date)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! MyDayViewController
        destinationVC.dataLable = dateLable.text
    }
   
}
