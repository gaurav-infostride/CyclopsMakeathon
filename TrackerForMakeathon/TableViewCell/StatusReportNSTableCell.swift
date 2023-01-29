//
//  StatusReportNSTableCell.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 16/12/22.
//

import Cocoa

class StatusReportNSTableCell: NSTableCellView {
    @IBOutlet weak var taskTextField: NSTextField!
    @IBOutlet weak var editBtn: NSButton!
    @IBOutlet weak var viewTaskDetailsBtn: NSButton!
    let viewModel = UserViewModel.shared.self

    var editTaskCallback: (()->())?
    var viewTaskCallback: (()->())?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
//        print(viewModel.updateTask?.data?.data?.submited)
//        
//        editBtn.isHidden = viewModel.updateTask?.data?.data?.submited ?? false
        
    }
    
    
    @IBAction func onViewBtn(_ sender: Any) {
        viewTaskCallback?()
    }
    
    @IBAction func onEditBtn(_ sender: Any) {
        editTaskCallback?()
    }
    
}
