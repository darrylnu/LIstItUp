//
//  SecondViewController.swift
//  To Do List
//
//  Created by Darryl Nunn on 2/2/16.
//  Copyright © 2016 Darryl Nunn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var itemField: UITextField!
    
    @IBAction func addItemButton(sender: AnyObject) {
        
        toDoList.append(itemField.text!)
        
        itemField.text = ""
        //updates the user defaults with new items appended to toDoList
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.itemField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //if touches happen outside of keyboard, then keyboard rescinds
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //enables return button to be pressed and keyboard to rescind
    func textFieldShouldReturn (textField: UITextField) -> Bool {
        
        itemField.resignFirstResponder()
        
        return true
    }

}

