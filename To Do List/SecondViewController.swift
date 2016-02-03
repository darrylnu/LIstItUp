//
//  SecondViewController.swift
//  To Do List
//
//  Created by Darryl Nunn on 2/2/16.
//  Copyright © 2016 Darryl Nunn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var itemField: UITextField!
    
    @IBAction func addItemButton(sender: AnyObject) {
        
        toDoList.append(itemField.text!)
        
        itemField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

