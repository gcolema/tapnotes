//
//  NoteDetailsViewController.swift
//  TapNotes
//
//  Created by Georgina Coleman on 11/25/15.
//  Copyright © 2015 Georgina Coleman. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UITableViewController {
 
   
    @IBOutlet var noteLabel: UITextField!
 
    var note:Note?
    
    
    required init?(coder aDecoder: NSCoder) {
        print("init NoteDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit NoteDetailsViewController")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
        noteLabel.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "savenoteDetail" {
            note = Note(noteDetail: noteLabel.text)
            print(noteLabel.text)
        }
       
    }
    
 

    
 
    
}

