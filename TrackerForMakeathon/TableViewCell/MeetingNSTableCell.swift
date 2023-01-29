//
//  MeetingNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 04/01/23.
//

import Cocoa

class MeetingNSTableCell: NSTableCellView {
    
    @IBOutlet weak var meetingRoomLbl: NSTextField!
    @IBOutlet weak var meetingDateLbl: NSTextField!
    
    @IBOutlet weak var viewBtn: NSButton!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    
    @IBAction func onViewBtnActn(_ sender: Any) {
        k.showAllert(title: "Meeting Room Booking", message: "This feature is under development")
    }
}
