//
//  ViewController.swift
//  MakeMyDay
//
//  Created by Andrew on 07.11.15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"1234.png")!)
    }
    
    let reuseIdentifier = "cell"
    var items: [String] = ["Waking up","Have breakfast", "Have dinner","Have supper","Sport",     "Children", "Meeting","Time on the road", "Job", "Pet", "Celebration", "Cinema", "Shoping", "Leisure time", "Go to sleep"]
    var icons : [UIImage] = [UIImage(named: "wakingUp.png")!,UIImage(named: "breackfast.png")!, UIImage(named: "haveDinner.png")!, UIImage(named: "haveSupper.png")!, UIImage(named: "sport.png")!, UIImage(named: "children.png")!, UIImage(named: "meeting.png")!, UIImage(named: "timeOnTheRoad.png")!,UIImage(named: "job.png")!, UIImage(named: "pet.png")!,UIImage(named: "celebration.png")!, UIImage(named: "cinema.png")!, UIImage(named: "shopping.png")!,UIImage(named: "leisureTime.png")!, UIImage(named: "goToSleep.png")!]
    var selectedItems: [String] = []
    var selectedIcons: [UIImage] = []
    var selItemsManaged = [NSManagedObject]()
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        cell.myLabel.text = self.items[indexPath.item]
        cell.image.image = icons[indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.backgroundColor = UIColor(red: 242/255, green: 199/255, blue: 140/255, alpha: 1)
        print(indexPath.item)
        selectedItems.append(self.items[indexPath.row])
        selectedIcons.append(self.icons[indexPath.row])
        print(selectedItems)
        DataManager.sharedInstance.selectedItems = self.selectedItems
        DataManager.sharedInstance.selectedIcons = self.selectedIcons
        
    }
    
    // Hide NavigationBar
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    // send array
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! TimingTableViewController
        
        destViewController.arrayForTable = selectedItems
        
        
    }
    
}









