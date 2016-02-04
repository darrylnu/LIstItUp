//
//  FirstViewController.swift
//  To Do List
//
//  Created by Darryl Nunn on 2/2/16.
//  Copyright © 2016 Darryl Nunn. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet var toDoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checks to see if user defaults already exists
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        //if so, populate the toDoList array with what is saved in the defaults
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function that creates the same nummber of rows as the length of the list
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }
    
    
    //update the content of the table when the app is loaded
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    //function that allows for cells to be deleted
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //checks to see if left swipe has happened
        if editingStyle == UITableViewCellEditingStyle.Delete {
            //if so, remove that item in that row
            toDoList.removeAtIndex(indexPath.row)
            //create fade animation
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //update user defaults persistent data
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            //reload the table view
            toDoListTable.reloadData()
        }
    }
    
    //whenever this view is switched to, reload the data
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }

}

