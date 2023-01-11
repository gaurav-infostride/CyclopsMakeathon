//
//  EditTaskViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 28/12/22.
//

import Cocoa
import Foundation
class EditTaskViewController: NSViewController {
    @IBOutlet weak var editTastTextField: NSTextField!
    @IBOutlet var taskDiscriptionTextView: NSTextView!
    @IBOutlet weak var taskDetailsDocCollectionView: NSCollectionView!
    
    // Create Date
    let date = Date()
    let viewModel = UserViewModel.shared
    var task:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDetailsDocCollectionView.dataSource = self
        taskDetailsDocCollectionView.delegate = self
        
        //register Nib
        taskDetailsDocCollectionView.register(EditTaskDetailCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: k.CollectionViewItem.editTaskDetailXib))
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        editTastTextField.stringValue = task ?? ""
        print("task on EditTaskViewController",task)
    }
    
    @IBAction func onSave(_ sender: Any) {
        viewModel.taskData?.timeAdded? = date
        viewModel.taskData?.taskName = self.editTastTextField.stringValue
        viewModel.taskData?.taskDiscription = self.editTastTextField.stringValue
        dismiss(self)
    }
    
}

extension EditTaskViewController: NSCollectionViewDataSource{
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // Try to reuse an existing collection view item
        if let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: k.CollectionViewItem.editTaskDetailXib), for: indexPath) as? EditTaskDetailCollectionViewItem {
            return item
        }
        return NSCollectionViewItem()
        
    }
    
    
}
extension EditTaskViewController: NSCollectionViewDelegate{
    
}
