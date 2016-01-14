//
//  DataManager.swift
//  MakeMyDay
//
//  Created by Andrew on 11/19/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import Foundation
import UIKit
class DataManager: NSObject {
    
    static let sharedInstance = DataManager()
    var timeDict : [String:[String: NSDate]] = [:]
    var selectedItems: [String] = []
    var selectedIcons: [UIImage] = []
    var dayForRecord = NSDate()
}