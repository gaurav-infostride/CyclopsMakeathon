//
//  EditProfileNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 03/01/23.
//

import Cocoa

class EditProfileNSTableCell: NSTableCellView {
    var callback: (()->())?

    @IBOutlet weak var editProfileBtns: NSButton!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    
    @IBAction func onProfileBtn(_ sender: Any) {
        print("Hii")
        var callback: (()->())?
    }
    
    
    
}
