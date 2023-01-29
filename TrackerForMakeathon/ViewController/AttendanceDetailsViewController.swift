//
//  AttendanceDetailsViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 11/01/23.
//

import Cocoa

class AttendanceDetailsViewController: NSViewController {
    @IBOutlet weak var topView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.wantsLayer = true
        topView.layer?.backgroundColor = NSColor.systemTeal.cgColor
    }
    
}
