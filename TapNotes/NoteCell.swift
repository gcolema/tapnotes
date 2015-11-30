//
//  NoteCell.swift
//  TapNotes
//
//  Created by Georgina Coleman on 11/23/15.
//  Copyright © 2015 Georgina Coleman. All rights reserved.
//

import Foundation

import UIKit

class NoteCell: UITableViewCell {
    

    @IBOutlet var noteLabel: UILabel!
    
    var note: Note!{
        didSet{
            noteLabel.text=note.noteDetail
        }
    }
    
}
