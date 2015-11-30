//
//  NoteViewController.swift
//  TapNotes
//
//  Created by Georgina Coleman on 11/23/15.
//  Copyright © 2015 Georgina Coleman. All rights reserved.
//

import UIKit

class NoteViewController: UITableViewController {

    
    var notes:[Note] = notesData
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
                as! NoteCell
            
            let note = notes[indexPath.row] as Note
            cell.note = note
            return cell
    }
    
    // Mark Unwind Segues
    @IBAction func cancelTonotesViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savenoteDetail(segue:UIStoryboardSegue) {
        if let noteDetailsViewController = segue.sourceViewController as? NoteDetailsViewController {
            
            //add the new note to the notes array
            if let note = noteDetailsViewController.note {
                notes.append(note)
                
                //update the tableView
                let indexPath = NSIndexPath(forRow: notes.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            notes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // end class

    }
