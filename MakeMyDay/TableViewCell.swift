//
//  TableViewCell.swift
//  MakeMyDay
//
//  Created by Andrew on 12.11.15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var lableTill: UILabel!
    @IBOutlet weak var lableFrom: UILabel!
    @IBOutlet weak var lableOfCell: UILabel!
    
        
    
    override func awakeFromNib() {
        
               super.awakeFromNib()
       
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
   
    
}
