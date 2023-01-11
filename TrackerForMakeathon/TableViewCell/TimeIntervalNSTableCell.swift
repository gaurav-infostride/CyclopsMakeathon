//
//  TimeIntervalNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 17/12/22.
//

import Cocoa

class TimeIntervalNSTableCell: NSTableCellView {

    @IBOutlet weak var dateLabel: NSTextField!
    @IBOutlet weak var punchInTimeLabel: NSTextField!
    @IBOutlet weak var punchOutTimeLabel: NSTextField!
    @IBOutlet weak var durationLabel: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
