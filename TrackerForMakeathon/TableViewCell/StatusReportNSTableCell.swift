//
//  StatusReportNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 16/12/22.
//

import Cocoa

class StatusReportNSTableCell: NSTableCellView {
    var callback: (()->())?
    @IBOutlet weak var taskTextField: NSTextField!
    
    
    @IBOutlet weak var editBtn: NSButton!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
//        taskLabel.stringValue = "Gaurav"
        // Drawing code here.
    }
    
    
   
    @IBAction func onEditBtn(_ sender: Any) {
        print("Edit Pressec on cell")
        callback?()
    }
    
}
