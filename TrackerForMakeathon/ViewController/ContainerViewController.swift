//
//  ContainerViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 02/01/23.
//

import Cocoa

class ContainerViewController: NSViewController, NSWindowDelegate {
    
    
    @IBOutlet weak var topView: NSView!
    @IBOutlet weak var container: NSView!
    
    
    @IBOutlet var parentView: NSView!
    @IBOutlet weak var profileView: NSView!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var profileBtn: NSButton!
    
    
    @IBOutlet weak var dashboardBtn: NSButton!
    @IBOutlet weak var allTaskBtn: NSButton!
    @IBOutlet weak var attendanceBtn: NSButton!
    
    var dashboardVC : DashboardViewController!
    var taskVC : TaskDetailsViewController!
    var attendanceVC : AttendanceDetailsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a child view controller and add it to the current view controller.
        dashboardVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.dashboardVC) as? DashboardViewController
        taskVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.taskDetailsVC) as? TaskDetailsViewController
        attendanceVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.attendanceDetailsVC) as? AttendanceDetailsViewController
        
        //Add the view controller to the container.
//        addChild(dashboardVC)
        dashboardVC.view.frame = self.container.bounds
        self.container.addSubview(dashboardVC.view)
        view.addSubview(dashboardVC.view)
        
        print("Container in viewdidload -=>", container)
    }
    
    
    override func viewWillAppear() {
        super.viewWillAppear()
        topView.wantsLayer = true
        container.wantsLayer = true
        profileView.wantsLayer = true
        
        topView.layer?.backgroundColor = CGColor.black
        profileView.layer?.cornerRadius = CGRectGetWidth(self.profileView.frame)/2
        dashboardBtn.contentTintColor = .systemTeal
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        container.window?.delegate = self
        view.window?.delegate = self
        print("Container's View in ViewDidAppear -=>", container)
    }
    
    
    
    
    func windowDidResize(_ notification: Notification) {
        
        container.setFrameSize(view.frame.size)
        print(container.frame.size)
        print(view.frame.size)
    }
    
    
//    func setupContainerView() {
//        let containerView = NSView(frame: container.bounds)
//        containerView.autoresizingMask = [.width, .height]
//        containerView.addSubview(container)
//    }
//    
//    func setupChildView(childView:NSView) {
//        let childView = NSView(frame: container.frame)
//        childView.autoresizingMask = [.width, .height]
//        view.addSubview(childView)
//    }
//    
//    
    
//    
//    func resizeChildView(newView:NSView,containerView: NSView!){
//        newView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
//        newView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
//        newView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
//        newView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
//    }
//    
//    func resizeV(controller:NSViewController){
//        NSLayoutConstraint.activate([
//            controller.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
//            controller.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 20),
//            controller.view.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
//            controller.view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 20)
//        ])
//        
//    }
//    
    
    
    
    
    
    
    
    @IBAction func onProfileBtn(_ sender: Any) {
        print("hii")
        performSegue(withIdentifier: k.Segue.editProfileSegue, sender: self)
    }
    
    
    func hideContentController(content: NSViewController) {
        content.view.viewWillMove(toSuperview: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    
    @IBAction func onDashboard(_ sender: Any) {
        dashboardBtn.contentTintColor = .systemTeal
        allTaskBtn.contentTintColor = .white
        attendanceBtn.contentTintColor = .white
        hideContentController(content: taskVC)
        hideContentController(content: attendanceVC)
        
        addChild(dashboardVC)
        container.addSubview(dashboardVC.view)
        
        
    }
    
    @IBAction func onAllTask(_ sender: Any) {
        allTaskBtn.contentTintColor = .systemTeal
        dashboardBtn.contentTintColor = .white
        attendanceBtn.contentTintColor = .white
        
        hideContentController(content: dashboardVC)
        hideContentController(content: attendanceVC)
        
        addChild(taskVC)
        container.addSubview(taskVC.view)
        
        
    }
    
    @IBAction func onAttendence(_ sender: Any) {
        attendanceBtn.contentTintColor = .systemTeal
        allTaskBtn.contentTintColor = .white
        dashboardBtn.contentTintColor = .white
        
        hideContentController(content: dashboardVC)
        hideContentController(content: taskVC)
        
        addChild(attendanceVC)
        container.addSubview(attendanceVC.view)
        
    }
    
}


//setupContainerView()
//let childView = NSView(frame: container.bounds)
//childView.setFrameSize(container.bounds.size)
//container.setFrameSize(childView.frame.size)

//        for sView in self.container.subviews{
//            sView.removeFromSuperview()
//
//        }


//        resizeChildView(newView: dashboardVC.view, containerView: container)


// Create and activate the constraints for the child’s view.
//        kCGWindowIsOnscreen = config
//           onscreenConstraints = configureConstraintsForContainedView(containedView: dashboardVC.view,
//                                     stage: .onscreen)
//           NSLayoutConstraint.activate(onscreenConstraints)
//
//           // Notify the child view controller that the move is complete.
//           viewController.didMove(toParent: self)






//        addChild(dashboardVC)
//        view.addSubview(dashboardVC.view)
//        setupContainerView()
//        dashboardVC.view.frame = self.container.bounds
