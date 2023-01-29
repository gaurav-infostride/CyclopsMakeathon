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
    @IBOutlet weak var saveBtn: NSButton!
    
    @IBOutlet weak var saveBtnStack: NSStackView!
    // ViewModel Object
    let viewModel = UserViewModel.shared
    
    // Date Object
    let date = Date()
    
    
    var taskTitle:String?
    var discription:String?
    var createdAt:String?
    var taskId:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTastTextField.stringValue = taskTitle ?? ""
        taskDiscriptionTextView.string = discription ?? ""
        taskDetailsDocCollectionView.dataSource = self
        taskDetailsDocCollectionView.delegate = self
        
        if self.viewModel.isViewTask == true {
            self.saveBtn.isHidden = true
            self.saveBtnStack.isHidden = true
            self.editTastTextField.isEditable = false
            self.taskDiscriptionTextView.isEditable = false
        }else{
            self.saveBtn.isHidden = false
            self.saveBtnStack.isHidden = false
            self.editTastTextField.isEditable = false
            self.taskDiscriptionTextView.isEditable = true
        }
        //register Nib
        taskDetailsDocCollectionView.register(EditTaskDetailCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: k.CollectionViewItem.editTaskDetailXib))
    }
    
    @IBAction func onSave(_ sender: Any) {
        guard taskDiscriptionTextView.string != "" else {
            k.showAllert(title: "Update Task", message: "Add Task Description")
            return}
        let updatedAt = k.at(date: date)
        if let safeId = taskId{
            viewModel.updateTask(id: safeId, description:taskDiscriptionTextView.string ) { completion in
                if completion == "SUCCESS"{
                    DispatchQueue.main.async {
                        self.dismiss(self)
                    }
                    k.showAllert(title: "Update Task", message: "Task Updated Successfully")
                }else{
                    DispatchQueue.main.async {
                        self.dismiss(self)
                        
                    }
                }
                
            }
        }
        
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
