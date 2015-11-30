//
//  InterfaceController.swift
//  TapNotesWatch Extension
//
//  Created by Georgina Coleman on 11/15/15.
//  Copyright © 2015 Georgina Coleman. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var TableOutlet: WKInterfaceTable!
    
     var arrayNotes = ["Welcome to TapNotes","Be positive!"];
    
    func populateTableView(){
        
        TableOutlet.setNumberOfRows(arrayNotes.count, withRowType: "row")
        
        
        for(var i=0; i<arrayNotes.count; i++){
            let row = TableOutlet.rowControllerAtIndex(i) as! rowController
            let labelValue = arrayNotes[i]
            let rowText = labelValue
            //let index = i.description
           
            row.rowLabel.setText(rowText)
        }
    }
    
    func insertRow(labelValue: String){
        
        arrayNotes.append(labelValue)
        
        populateTableView();
        
    }
    
    
    func deleteRow(position: Int){
        
        arrayNotes.removeAtIndex(position)
        
        populateTableView();

    }


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        populateTableView();
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnPressed() {
        presentTextInputControllerWithSuggestions(["buy groceries", "dinner with friends", "important meeting", "exam this week", "dr appt", "call friends/relatives"], allowedInputMode: WKTextInputMode.Plain)
            {(results) -> Void in
                if results != nil {
                    //String---
                    let symbol = results!.first as? String
                    if symbol != nil{
                        //self.arrayNotes.append(symbol!)
                        self.insertRow(symbol!)
                    }
                }
        }
        

        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = TableOutlet.rowControllerAtIndex(rowIndex) as! rowController
        // row.rowLabel.setText(row[rowIndex])
        
        row.rowLabel.setTextColor(UIColor.yellowColor())
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return arrayNotes[rowIndex]
    }
    @IBAction func btnPressedDelete() {
        if(self.arrayNotes.count>0){
            self.deleteRow(0)
        }
    }
}
