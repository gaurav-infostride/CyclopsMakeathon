//
//  Helper.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 17/12/22.
//

import Foundation
import AppKit
struct k{
    
    static func allert(title:String, message:String) -> Bool{
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        return alert.runModal() == NSApplication.ModalResponse.OK
    }
    
    
    static func showAllert(title:String, message:String){
        DispatchQueue.main.async {
            k.allert(title: title, message: message)
        }
    }
    
    //function takes cdate and return string format
    static func at(date:Date) -> String{
        let dateFormatter = DateFormatter()
        let createdAt = date
        dateFormatter.dateFormat = "MMM dd, yyyy hh:mm"
        dateFormatter.string(from: createdAt)
        return dateFormatter.string(from: createdAt)
    }
    
    static let appName = ""
    
    struct Storyboard{
        static let main = "Main"
    }
    struct Url{
        static let loginUrl = "http://10.20.1.70:8000/user/login"
        static let profileUrl = "http://10.20.1.70:8000/user/details"
        static let addTaskUrl = "http://10.20.1.70:8000/task/addtask"
        static let getTaskUrl = "http://10.20.1.70:8000/task/gettask"
        static let updateTaskUrl = "http://10.20.1.70:8000/task/updatetask"
    }
    
    struct ViewController{
        static let signInVC = "ViewController"
        static let containerVC = "ContainerViewController"
        static let dashboardVC = "Dashboard"
        static let attendanceDetailsVC = "AttendanceDetailsViewController"
        static let taskDetailsVC = "TaskDetailsViewController"
        static let editTaskVC = "EditTaskViewController"
        static let profileVC = "ProfileViewController"
    }
    
    struct Segue{
        static let editTaskSegue = "EditTaskViewControllerSegue"
        static let editProfileSegue = "editProfileSegue"
        static let dashboardSegue = "toDashboard"
    }
    
    struct CollectionViewItem{
        //Edit Task Details Collection View
        static let editTaskDetailXib = "EditTaskDetailXib"
        //        static let editBtnColumn = "editBtnColumn"
    }
    
    struct TableViewItem{
        //Meeting Manager Table View
        static let meetingRoomColumn = "meetingRoomColumn"
        static let meetingDateColumn = "meetingDateColumn"
        static let meetingStatusColumn = "meetingStatusColumn"
        
        static let meetingRoomCell = "meetingRoomCell"
        static let meetingDateCell = "meetingDateCell"
        static let meetingStatusCell = "meetingStatusCell"
        
        //Holiday Manager Table View
        static let holidayNameColumn = "HolidayNameColumn"
        static let holidayDateColumn = "HolidayDateColumn"
        static let holidayDayColumn = "HolidayDayColumn"
        
        static let holidayNameCell = "HolidayNameCell"
        static let holidayDateCell = "HolidayDateCell"
        static let holidayDayCell = "HolidayDayCell"
        
        
        //Task Manager Table View
        static let taskColumn = "taskColumn"
        static let editBtnColumn = "editBtnColumn"
        
        static let taskCell = "taskCell"
        static let editBtnCell = "editBtnCell"
        
        //Attendance Manager Table View
        static let dateColumn = "dateColumn"
        static let punchInTimeColumn = "punchInTimeColumn"
        static let workDurationColumn = "workDurationColumn"
        static let breakDurationColumn = "breakDurationColumn"
        static let punchOutTimeColumn = "breakDurationColumn"
        static let durationColumn = "durationColumn"
        
        
        static let dateCell = "dateCell"
        static let punchInTimeCell = "punchInTimeCell"
        static let workDurationCell = "workDurationCell"
        static let breakDurationCell = "breakDurationCell"
        
        static let punchOutTimeCell = "punchOutTimeCell"
        static let durationCell = "durationCell"
        
        static let dateField = "dateField"
        static let punchInTimeField = "punchInTimeField"
        static let punchOutTimeField = "punchOutTimeField"
        static let durationField = "durationField"
    }
    
    
    struct AppColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandPBlue"
        static let lightBlue = "BrandLightBlue"
        
    }
    
}

extension NSViewController {
    //    func alertMessage(title: String?, message: String?, preferredStyle : NSAlert.Style,completion: (() -> Void)? = nil){
    //        let alertMessage = NSAlert(title: title, message: message, preferredStyle: preferredStyle)
    //        let action = UIAlertAction(title: "OK", style: .default) {_ in
    //            completion?()
    //        }
    //        alertMessage.addAction(action)
    //        self.present(alertMessage, animated: false, completion: nil)
    //    }
    //    func alertMessageDestructive(title: String?, message: String?, preferredStyle : UIAlertController.Style,completion: (() -> Void)? = nil){
    //        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    //        let action = UIAlertAction(title: "OK", style: .destructive) {_ in
    //            completion?()
    //        }
    //        alertMessage.addAction(action)
    //        self.present(alertMessage, animated: false, completion: nil)
    //    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}


//        Date().string(format: "EEEE, MMM d, yyyy") // Saturday, Oct 21, 2017
//        Date().string(format: "MM/dd/yyyy")        // 10/21/2017
//        Date().string(format: "MM-dd-yyyy HH:mm")  // 10-21-2017 03:31
//
//        Date().string(format: "MMM d, h:mm a")     // Oct 21, 3:31 AM
//        Date().string(format: "MMMM yyyy")         // October 2017
//        Date().string(format: "MMM d, yyyy")       // Oct 21, 2017
//
//        Date().string(format: "E, d MMM yyyy HH:mm:ss Z") // Sat, 21 Oct 2017 03:31:40 +0000
//        Date().string(format: "yyyy-MM-dd'T'HH:mm:ssZ")   // 2017-10-21T03:31:40+0000
//        Date().string(format: "dd.MM.yy")                 // 21.10.17


//        dateFormatter.dateFormat = "MMM d, yyyy"
//        print(dateFormatter.string(from: userPunchInAt!))

extension NSStoryboardSegue.Identifier {
    static let dashboardVCSegue = NSStoryboardSegue.Identifier("Dashboard")
    
}
