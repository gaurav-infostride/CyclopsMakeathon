//
//  HolidayNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 04/01/23.
//

import Cocoa

class HolidayNSTableCell: NSTableCellView {
    
    @IBOutlet weak var holidayNameLbl: NSTextField!
    @IBOutlet weak var holidayDateLbl: NSTextField!
    @IBOutlet weak var holidayDayLbl: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
