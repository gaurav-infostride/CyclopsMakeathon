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
    
    let viewModel = UserViewModel.shared
    
    // Create Date
    let date = Date()
    
    
    var task:String?
    var discription:String?
    var createdAt:String?
    var taskId:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTastTextField.stringValue = task ?? ""
        taskDiscriptionTextView.string = discription ?? ""
        taskDetailsDocCollectionView.dataSource = self
        taskDetailsDocCollectionView.delegate = self
        
        //register Nib
        taskDetailsDocCollectionView.register(EditTaskDetailCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: k.CollectionViewItem.editTaskDetailXib))
    }
    override func viewWillAppear() {
        super.viewWillAppear()
//        print(task)
//        print(createdAt)
//        print("task on EditTaskViewController",task)
    }
    
    @IBAction func onSave(_ sender: Any) {
        let updatedAt = k.at(date: date)
        if let safeId = taskId{
            viewModel.updateTask(id: safeId, description: taskDiscriptionTextView.string) { completion in
                if completion == "SUCCESS"{
                    DispatchQueue.main.async {
                        self.dismiss(self)
                    }
                    k.showAllert(title: "Update Task", message: "Task updated Successfully")
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
