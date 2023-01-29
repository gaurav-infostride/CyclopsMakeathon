//
//  TaskDetailsViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 18/01/23.
//

import Cocoa

class TaskDetailsViewController: NSViewController {

    @IBOutlet weak var topView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.wantsLayer = true
        topView.layer?.backgroundColor = NSColor.systemTeal.cgColor
    }
    
}
