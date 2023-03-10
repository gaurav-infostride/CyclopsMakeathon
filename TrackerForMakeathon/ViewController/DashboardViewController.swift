//
//  Dashboard.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 14/12/22.
//

import Cocoa
class DashboardViewController: NSViewController {
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    
    // Create Date
    let date = Date()
    
    var isPunchedIn = false
    
    //For add task
    var taskCreatedAt:String?
    var taskAtCell : String?
    var taskDescriptionAtCell : String?
    var taskId : String?
    
    //DurationModel
    var durationDataModel = DureationDataModel()
    struct DureationDataModel{
        var durationArray:[DurationeData] = []
    }
    struct DurationeData{
        var duration:String?
        init(duration: String?) {
            self.duration = duration
        }
    }
    
    //BreakDurationModel
    var breakDurationDataModel = BreakDureationDataModel()
    struct BreakDureationDataModel{
        var durationArray:[BreakDurationeData] = []
    }
    struct BreakDurationeData{
        var breaakDuration:String?
        init(breaakDuration: String?) {
            self.breaakDuration = breaakDuration
        }
    }
    
    
    //PunchOutDataSource/Model
    var punchOutTimeDataModel = PunchOutTimeDataModel()
    struct PunchOutTimeDataModel{
        var punchOutTimeArray:[PunchOutTimeData] = []
    }
    struct PunchOutTimeData{
        var punchOutAt:Date?
        init(punchOutAt: Date?) {
            self.punchOutAt = punchOutAt
        }
    }
    //MeetingRoomDataSource/Model
    var meetingRoomsNameArr = ["First Floor A","First Floor B","Second Floor A","Second Floor B","Third Floor A","Third Floor B","Fourth Floor A","Fourth Floor B","Reception A","Reception B","Cafeteria"]
    
    
    //HolidayNameDataSource/Model
    var holidayNameArr = ["New Year Day","Memorial Day","Independence Day","Labor Day","Deepavali","Extended Diwali Holiday","Pre-Thanks giving Day","Thanksgiving Day","Day after Thanksgiving Day"]
    //HolidayDateDataSource/Model
    var holidayDateArr = ["Jan 01, 2022", "May 30, 2022", "July 04, 2022", "Sept 05, 2022", "Oct 24, 2022", "Oct 25, 2022", "Nov 23, 2022", "Nov 24, 2022", "Nov 25, 2022"]
    //HolidayDayDataSource/Model
    var holidayDayArr = ["Saturday","Monday","Monday","Monday","Monday","Tuesday","Wednesday","Thursday","Friday"]
    
    struct TaskDetails {
        let date  = ["Jan 02, 2023","Jan 03, 2023","Jan 04, 2023","Jan 05, 2023","Jan 06, 2023","Jan 09, 2023","Jan 10, 2023","Jan 11, 2023","Jan 12, 2023","Jan 13, 2023","Jan 16, 2023","Jan 17, 2023","Jan 18, 2023","Jan 19, 2023","Jan 20, 2023","Jan 23, 2023","Jan 24, 2023","Jan 25, 2023","Jan 26, 2023","Jan 27, 2023"]
        let punchInTime  = ["4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM","4:00 PM"]
        let punchOutTime = ["1:00 AM","1:30 AM","1:40 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM","1:00 AM"]
        let status = ["Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","Approved","HalfDay","Pending"]
    }
    
    
    
    //PunchInDataSource/Model
    var punchInTimeDataModel = PunchInTimeDataModel()
    struct PunchInTimeDataModel{
        var punchInTimeArray:[PunchInTimeData] = []
    }
    struct PunchInTimeData{
        var punchinAt:Date?
        init(punchinAt: Date?) {
            self.punchinAt = punchinAt
        }
    }
    
    
    // Declare the timer as a property
    var timer: Timer?
    var breakTimer : Timer?
    var count = 0
    var seconds = 0
    var minutes = 0
    var hours = 0
    
    
    var isBreak = false
    
    var breakCount = 0
    var breakSeconds = 0
    var breakMinutes = 0
    var breakHours = 0
    
    
    @IBOutlet weak var dashboardView: NSView!
    
    //Employe Profile Manager items
    @IBOutlet weak var infoView: NSView!
    @IBOutlet weak var employeDetailsProfileImageView: NSImageView!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var employIdLabel: NSTextField!
    @IBOutlet weak var mobileNoLabel: NSTextField!
    @IBOutlet weak var gmailLabel: NSTextField!
    @IBOutlet weak var designationLabel: NSTextField!
    @IBOutlet weak var reportingManagerLabel: NSTextField!
    
    //Task Manager items
    @IBOutlet weak var taskView: NSView!
    @IBOutlet weak var addTaskTextField: NSTextField!
    @IBOutlet weak var addTaskTableView: NSTableView!
    
    
    //Attendance Manager items
    @IBOutlet weak var trackerView: NSView!
    @IBOutlet weak var punchInBtn: NSButton!
    @IBOutlet weak var punchOutBtn: NSButton!
    @IBOutlet weak var breakBtn: NSButton!
    @IBOutlet weak var restartBtn: NSButton!
    @IBOutlet weak var timerLabel: NSTextField!
    @IBOutlet weak var timerTypeLbl: NSTextField!
    @IBOutlet weak var timeIntervalNSTableView: NSTableView!
    
    
    //Holiday Manager items
    @IBOutlet weak var holidayView: NSView!
    @IBOutlet weak var holidayNSTableView: NSTableView!
    
    
    //Meeting Manager items
    @IBOutlet weak var meetingNSTableView: NSTableView!
    @IBOutlet weak var meetingView: NSView!
    
    
    //Announcement Manager items
    @IBOutlet weak var announcementView: NSView!
    
    
    let viewModel = UserViewModel.shared.self
    //    var taskData = TaskData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Providing NSView layer
        dashboardView.wantsLayer = true
        infoView.wantsLayer = true
        taskView.wantsLayer = true
        trackerView.wantsLayer = true
        holidayView.wantsLayer = true
        announcementView.wantsLayer = true
        meetingView.wantsLayer = true
        
        //Providing NSView background color
        dashboardView.layer?.backgroundColor = NSColor.systemTeal.cgColor
        infoView.layer?.backgroundColor = NSColor.white.cgColor
        taskView.layer?.backgroundColor = NSColor.white.cgColor
        trackerView.layer?.backgroundColor = NSColor.white.cgColor
        holidayView.layer?.backgroundColor = NSColor.white.cgColor
        announcementView.layer?.backgroundColor = NSColor.white.cgColor
        meetingView.layer?.backgroundColor = NSColor.white.cgColor
        
        
        //Providing NSLable layer
        timerLabel.wantsLayer = true
        timerTypeLbl.wantsLayer = true
        
        //Providing NSButton layer
        punchInBtn.wantsLayer = true
        breakBtn.wantsLayer = true
        restartBtn.wantsLayer = true
        
        //Hiding break and restart Button as to unhide it on conditions. Using same view for break restart and punchin Button.
        breakBtn.isHidden = true
        restartBtn.isHidden = true
        
        //Providing ImageView layer
        employeDetailsProfileImageView.wantsLayer = true
        
        //Doing Corner radius for employe ImageView
        employeDetailsProfileImageView.layer?.cornerRadius = CGRectGetWidth(self.employeDetailsProfileImageView.frame)/2
        
        //Providing Tableview Datasource and Delagate
        addTaskTableView.delegate = self
        addTaskTableView.dataSource = self
        timeIntervalNSTableView.delegate = self
        timeIntervalNSTableView.dataSource = self
        holidayNSTableView.dataSource = self
        holidayNSTableView.delegate = self
        meetingNSTableView.dataSource = self
        meetingNSTableView.delegate = self
        getProfileData()
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        //var red = CGColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        getSubmitedTask()
        getPunchDetails()
    }
    func getPunchDetails(){
        viewModel.getPunchDetails {
            print("punchDetailsModel",self.viewModel.punchDetailsModel)
            DispatchQueue.main.async {
                self.timeIntervalNSTableView.reloadData()
            }
        }
    }
    
    func getProfileData(){
        viewModel.getProfileData {
            if let myUser = self.viewModel.profileModel?.data?.user{
                DispatchQueue.main.async {
                    self.nameLabel.stringValue = "\(myUser.firstName ?? "") \(myUser.lastName ?? "")"
                    self.employIdLabel.stringValue = String("Employee-Id: \(myUser.employeeCode ?? "")")
                    self.mobileNoLabel.stringValue = myUser.phone ?? ""
                    self.gmailLabel.stringValue = myUser.email ?? ""
                    self.designationLabel.stringValue = myUser.designation ?? ""
                    if myUser.isPunchedIn == true{
                        self.punchOutBtn.isHidden = false
                        self.punchInBtn.isHidden = true
                    }else{
                        self.punchOutBtn.isHidden = true
                        self.punchInBtn.isHidden = false
                    }
                    //self.reportingManagerLabel.stringValue = "\(myUser.reportingManager?.firstName ?? "") \(myUser.reportingManager?.lastName ?? "")"
                }
            }
        }
    }
    
    func getSubmitedTask(){
        viewModel.getTask {
            DispatchQueue.main.async {
                self.addTaskTableView.reloadData()
            }
            
        }
    }
    
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    
    
    @IBAction func onAddTask(_ sender: Any) {
        guard isPunchedIn else   {
            k.showAllert(title: "Add Task", message: "Plese PunchIn to Add Task")
            print("Plese Punch In to proceed")
            return
        }
        guard addTaskTextField.stringValue != "" else {
            k.showAllert(title: "Add Task", message: "Enter task title to add")
            return
        }
        taskCreatedAt = k.at(date: date)
        viewModel.addTask(taskTitle: addTaskTextField.stringValue) {
            k.showAllert(title: "Add Task", message: "Task add successfully")
            self.getSubmitedTask()
        }
        addTaskTextField.stringValue = ""
        
    }
    
    
    
    
    
    
    func startEventTracking(){
        print(NSEvent.pressedMouseButtons)
        let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.leftMouseDown.rawValue) | (1 << CGEventType.rightMouseDown.rawValue)
        
        let eventTap = CGEvent.tapCreate(tap: .cgSessionEventTap, place: .headInsertEventTap, options: .defaultTap, eventsOfInterest: CGEventMask(eventMask), callback:{ (proxy, type, event, refcon) -> Unmanaged<CGEvent>? in
            
            // code to handle keyboard and mouse events
            return Unmanaged.passRetained(event)
            
        }, userInfo: nil)
        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: eventTap!, enable: true)
        
        // wait for 5 minutes
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 * 60) {
            self.count = -300
            self.breakCount = +300
            self.breakTimer?.fire()
            self.timer?.invalidate()
        }
        
        CFRunLoopRun()
        
        //        NSEvent *(^eventHandler)(NSEvent*) = ^(NSEvent *event) {
        //            // Handle the event here
        //            return event;
        //        };
        //        eventMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSAnyEventMask handler:eventHandler];
        //        [NSTimer scheduledTimerWithTimeInterval:300.0 target:self selector:@selector(logout) userInfo:nil repeats:NO];
        
    }
    
    
    // This function will be called every time the timer fires
    @objc func updateTimer() {
        count += 1
        hours = count / 3600 //3600
        minutes = (count % 3600) / 60
        seconds = (count % 3600) % 60
        print("Work----->",hours, minutes, seconds)
        if !isBreak{
            DispatchQueue.main.async {
                self.timerLabel.stringValue = String(format: "%02d:%02d:%02d", self.hours, self.minutes,self.seconds)
            }
        }
        print("PressedMouseButtons",NSEvent.pressedMouseButtons)
        //        print(NSEvent.KE)
        if count == 28800 { //28800
            timer?.invalidate()
            let punchOutTime = PunchOutTimeData.init(punchOutAt: date)
            punchOutTimeDataModel.punchOutTimeArray.append(punchOutTime)
            let durationStamp = String(format: "%02d:%02d", hours, minutes)
            print(durationStamp)
            let workDuration = DurationeData.init(duration: durationStamp )
            durationDataModel.durationArray.append(workDuration)
            self.timeIntervalNSTableView.reloadData()
            punchInBtn.isEnabled = false
            punchInBtn.isHidden = false
            punchInBtn.title = "Completed"
            isPunchedIn = false
//            breakBtn.isHidden = true
//            breakBtn.isEnabled = false
            restartBtn.isHidden = true
            restartBtn.isEnabled = false
        }
    }
    
    
    @IBAction func onPunchIn(_ sender: Any) {
        viewModel.getPunchin {_ in
            print("PunchIn Success")
            self.isPunchedIn = true
            DispatchQueue.main.async {
                self.punchOutBtn.isHidden = false
                self.punchInBtn.isHidden = true
                self.timerTypeLbl.textColor = self.punchInBtn.bezelColor
                self.timerTypeLbl.stringValue = ""//"Work"
            }
            DispatchQueue.main.async {
                self.timeIntervalNSTableView.reloadData()
            }
            self.viewModel.getPunchDetails {
                DispatchQueue.main.async {
                    self.timeIntervalNSTableView.reloadData()
                }
            }
            
        }
        let punchInTime = PunchInTimeData.init(punchinAt: self.date)
        print("PunchIn At", punchInTime)
        //self.punchInTimeDataModel.punchInTimeArray.append(punchInTime)
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        self.timer?.fire()
        
    }
    
    
    
    @IBAction func onPunchOut(_ sender: Any) {
        let workDurationStamp = String(format: "%02d:%02d", hours, minutes)
        viewModel.workDuration = workDurationStamp
        print(viewModel.workDuration)
        print("Id ",self.viewModel.punchDetailsModel?.data?.data?.last?.id)
        guard let safePunchId = self.viewModel.punchDetailsModel?.data?.data?.last?.id else {
            k.showAllert(title: "Punch Out", message: "PunchId nil")
            return
        }
        viewModel.punchOut(punchInId: safePunchId, duration: viewModel.workDuration ?? "0") {
            print("PunchOut Success")
            self.timeIntervalNSTableView.reloadData()
        }
        self.punchInBtn.isHidden = false
        self.punchOutBtn.isHidden = true
        self.isPunchedIn = false
        
        self.timer?.invalidate()
        self.breakTimer?.invalidate()
        
        let punchOutTime = PunchOutTimeData.init(punchOutAt: self.date)
        print("PunchOut At", punchOutTime)
    }
    
    // This method will be called every time the timer fires
    @objc func updateBreakTimer() {
        breakCount += 1
        breakHours = breakCount / 3600 //3600
        breakMinutes = (breakCount % 3600) / 60
        breakSeconds = (breakCount % 3600) % 60
        print("Break---->>",breakHours, breakMinutes, breakSeconds  )
        if isBreak{
            timerLabel.stringValue = String(format: "%02d:%02d", breakHours, breakMinutes)
        }
    }
    
    @IBAction func onBreak(_ sender: Any) {
//        restartBtn.isHidden = false
//        breakBtn.isHidden = true
        isBreak = true
        timer?.invalidate()
        timerLabel.textColor = breakBtn.bezelColor
        timerTypeLbl.textColor = breakBtn.bezelColor
        timerTypeLbl.stringValue = "Break"
        let workDurationStamp = String(format: "%02d:%02d:%02d", self.hours, self.minutes,self.seconds)
        print(workDurationStamp)
        viewModel.workDuration = workDurationStamp
        breakTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateBreakTimer), userInfo: nil, repeats: true)
        breakTimer?.fire()
        timer?.invalidate()
        self.timeIntervalNSTableView.reloadData()
    }
    
    @IBAction func onRestart(_ sender: Any) {
//        restartBtn.isHidden = true
//        breakBtn.isHidden = false
        isBreak = false
        breakTimer?.invalidate()
        timerLabel.textColor = punchInBtn.bezelColor
        timerTypeLbl.textColor = punchInBtn.bezelColor
        timerTypeLbl.stringValue = ""//"Work"
        let breakDurationStamp = String(format: "%02d:%02d:%02d", self.hours, self.minutes,self.seconds)
        print(breakDurationStamp)
        viewModel.breakDuration = breakDurationStamp
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timer?.fire()
        breakTimer?.invalidate()
        self.timeIntervalNSTableView.reloadData()
    }
    
}


//NSTableViewDataSource, NSTableViewDelegate
extension DashboardViewController : NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        if tableView == addTaskTableView {
            return self.viewModel.getTaskModel?.data?.task?.count ?? 0
        } else if tableView == timeIntervalNSTableView {
            return self.viewModel.punchDetailsModel?.data?.data?.count ?? 0
        }else if tableView == holidayNSTableView {
            print(holidayNameArr.count)
            return holidayNameArr.count
        }else if tableView == meetingNSTableView{
            print(meetingRoomsNameArr.count)
            return meetingRoomsNameArr.count
        }
        return 0
        
    }
    
    //Preparing Segue
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == k.Segue.editTaskSegue{
            if let vc = segue.destinationController as? EditTaskViewController {
                vc.taskTitle = taskAtCell
                vc.discription = taskDescriptionAtCell
                
                vc.createdAt = taskCreatedAt
                vc.taskId = taskId
            }
        }
    }
    
    //NSTableViewDelegate method. Creating table cell view for table columns
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        //Creating table cell view for addTaskTableView taskColumn
        if tableView == addTaskTableView {
            if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.taskColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.taskCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? StatusReportNSTableCell else { return nil }
                if let taskTitle =  self.viewModel.getTaskModel?.data?.task?[row].title{
                    cellView.taskTextField.stringValue = taskTitle
                }
                return cellView
            }
            
            //Creating table cell view for addTaskTableView editBtnColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.editBtnColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.editBtnCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? StatusReportNSTableCell else { return nil }
                guard let safeTitle = self.viewModel.getTaskModel?.data?.task?[row].title, let safeDescription = self.viewModel.getTaskModel?.data?.task?[row].description, let safeId = self.viewModel.getTaskModel?.data?.task?[row].id else {return nil }
                if self.viewModel.getTaskModel?.data?.task?[row].submited  == true{
                    cellView.editBtn.isHidden = true
                    cellView.viewTaskDetailsBtn.isHidden = false
                } else{
                    cellView.editBtn.isHidden = false
                    cellView.viewTaskDetailsBtn.isHidden = true
                }
                cellView.editTaskCallback = {
                    DispatchQueue.main.async {
                        self.viewModel.isViewTask = false
                        self.taskAtCell = safeTitle
                        self.taskId = safeId
                        self.performSegue(withIdentifier: k.Segue.editTaskSegue, sender: self)
                    }
                }
                cellView.viewTaskCallback = {
                    self.viewModel.isViewTask = true
                    self.taskAtCell = safeTitle
                    self.taskDescriptionAtCell = safeDescription
                    self.performSegue(withIdentifier: k.Segue.editTaskSegue, sender: self)
                }
                return cellView
            }
            return nil
        }
        
        //Creating table cell view for TimeInterval TableView dateColumn
        else if tableView == timeIntervalNSTableView {
            //TimeIntervalNSTableView Delegate fonctions
            if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.dateColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.dateCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
                //                print("punchInDate",viewModel.punchDetailsModel?.data?.data?[row].punchInDate)
                if let  punchInDate = viewModel.punchDetailsModel?.data?.data?[row].punchInDate{
                    dateFormatter.date(from: punchInDate)
                    cellView.dateLabel.stringValue = punchInDate
                }
                return cellView
            }
            
            
            //Creating table cell view for TimeInterval TableView punchInTimeColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.punchInTimeColumn) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.punchInTimeCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
                if let  punchInTime = viewModel.punchDetailsModel?.data?.data?[row].startTime{
                    cellView.punchInTimeLabel.stringValue = punchInTime
                }
                return cellView
            }
            
            
            //Creating table cell view for TimeInterval TableView punchOutTimeColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.punchOutTimeColumn){
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.punchOutTimeCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
                if isPunchedIn{
                    //                    cellView.punchOutTimeLabel.stringValue = ""
                    return cellView
                }else {
                    if let  punchOutTime = punchOutTimeDataModel.punchOutTimeArray[row].punchOutAt{
                        print(punchOutTime)
                        dateFormatter.dateFormat = "hh:mm"
                        dateFormatter.string(from: punchOutTime)
                        cellView.punchOutTimeLabel.stringValue = dateFormatter.string(from: punchOutTime)
                    }
                    return cellView
                }
            }
            //Creating table cell view for TimeInterval TableView workDurationColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.workDurationColumn){
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.workDurationCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
                if let  workDuration = viewModel.punchDetailsModel?.data?.data?[row].workingHours{
                    cellView.workDurationLabel.stringValue = workDuration
                }
                return cellView
            }
            
//            //Creating table cell view for TimeInterval TableView breakDurationColumn
//            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.breakDurationColumn){
//                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.breakDurationCell)
//                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
//                if let  breakDuration = viewModel.punchDetailsModel?.data?.data?[row].workingHours{
//                    cellView.durationLabel.stringValue =  ""//breakDuration
//                }
//
//                return cellView
//            }
            
            //Creating table cell view for TimeInterval TableView durationColumn
//            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.durationColumn){
//                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.durationCell)
//                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TimeIntervalNSTableCell else { return nil }
//                if isPunchedIn {
//                    return cellView
//                } else {
//                    if let  duration = durationDataModel.durationArray[row].duration{
//                        print(duration)
//                        cellView.durationLabel.stringValue =  duration
//                    }
//                    return cellView
//                }
//            }
            
            return nil
        }
        
        
        //Creating table cell view for Holiday TableView holidayNameColumn
        else if tableView == holidayNSTableView {
            if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayNameColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayNameCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? HolidayNSTableCell else { return nil }
                cellView.holidayNameLbl.stringValue = holidayNameArr[row].description
                return cellView
            }
            //Creating table cell view for Holiday TableView holidayDateColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayDateColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayDateCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? HolidayNSTableCell else { return nil }
                cellView.holidayDateLbl.stringValue = holidayDateArr[row].description
                return cellView
            }
            //Creating table cell view for Holiday TableView holidayDayColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayDayColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.holidayDayCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? HolidayNSTableCell else { return nil }
                cellView.holidayDayLbl.stringValue = holidayDayArr[row].description
                return cellView
            }
            
        }
        
        
        //Creating table cell view for Meeting TableView meetingRoomColumn
        else if tableView == meetingNSTableView {
            if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingRoomColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingRoomCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? MeetingNSTableCell else { return nil }
                cellView.meetingRoomLbl.stringValue = meetingRoomsNameArr[row].description
                return cellView
            }
            //Creating table cell view for Meeting TableView meetingDateColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingDateColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingDateCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? MeetingNSTableCell else { return nil }
                let meetingDate = Date()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                dateFormatter.string(from: meetingDate)
                cellView.meetingDateLbl.stringValue = dateFormatter.string(from: meetingDate)
                return cellView
            }
            //Creating table cell view for Meeting TableView meetingStatusColumn
            else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingStatusColumn ) {
                let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: k.TableViewItem.meetingStatusCell)
                guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? MeetingNSTableCell else { return nil }
                //                cellView.holidayDayLbl.stringValue = holidayDayArr[row].description
                return cellView
            }
            
        }
        return nil
        
        
    }
    
    
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        if tableView == addTaskTableView {
            return false
        } else if tableView == timeIntervalNSTableView {
            return false
        }else if tableView == holidayNSTableView {
            return false
        }else if tableView == meetingNSTableView{
            return false
        }
        return false
        
    }
    
    
    
    
    
    //    func tableView(_ tableView: TimeIntervalNSTableView!, viewForHeaderInSection section: Int) -> NSView?{
    //      let headerView = NSView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
    //        headerView.wantsLayer = true
    //        headerView.layer?.backgroundColor = CGColor.black
    //        print(headerView.layer?.backgroundColor)
    //
    ////      if (section == integerRepresentingYourSectionOfInterest) {
    ////        headerView.backgroundColor = UIColor.redColor()
    ////      } else {
    ////        headerView.backgroundColor = UIColor.clearColor()
    ////      }
    //      return headerView
    //    }
}




//func editBtn(_ sender: NSButton) {
//        // Perform the action for the button here
//    print("edit Tapped")
//    }
//extension Dashboard : NSTableViewDataSource{
//
//}
//extension Dashboard : NSTableViewDelegate{
//
//
//}

//// Create Date
//let date = Date()
//
//// Create Date Formatter
//let dateFormatter = DateFormatter()
//
//// Set Date Format
//dateFormatter.dateFormat = "YY/MM/dd"
//
//// Convert Date to String
//dateFormatter.string(from: date)





