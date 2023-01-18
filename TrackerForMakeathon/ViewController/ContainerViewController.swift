//
//  ContainerViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 02/01/23.
//

import Cocoa

class ContainerViewController: NSViewController {
    
    
    @IBOutlet weak var topView: NSView!
    @IBOutlet weak var container: NSView!
    
    
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
        container.wantsLayer = true
        container.layer?.backgroundColor = NSColor.brown.cgColor
        
        // Create a child view controller and add it to the current view controller.
        dashboardVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.dashboardVC) as? DashboardViewController
        taskVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.taskDetailsVC) as? TaskDetailsViewController
        attendanceVC = NSStoryboard(name: k.Storyboard.main, bundle: .main).instantiateController(withIdentifier: k.ViewController.attendanceDetailsVC) as? AttendanceDetailsViewController
        
        //Add the view controller to the container.
//        addChild(dashboardVC)
        dashboardVC.view.frame = self.container.bounds
//        self.container.addSubview(dashboardVC.view)
        view.addSubview(dashboardVC.view)
        
        setupContainerView()
        
        
    }
    
    func setupContainerView() {
        let containerView = NSView(frame: container.bounds)
        containerView.autoresizingMask = [.width, .height]
        containerView.addSubview(container)
    }
    
    func setupChildView(childView:NSView) {
        let childView = NSView(frame: container.frame)
        childView.autoresizingMask = [.width, .height]
        view.addSubview(childView)
    }
    
    
    func windowDidResize(_ notification: Notification) {
        container.setFrameSize(container!.frame.size)
    }
    
    func resizeChildView(newView:NSView,containerView: NSView!){
        newView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        newView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        newView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        newView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    func resizeV(controller:NSViewController){
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            controller.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 20),
            controller.view.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            controller.view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 20)
        ])
        
    }
    func hideContentController(content: NSViewController) {
        content.view.viewWillMove(toSuperview: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.topView.wantsLayer = true
        var topViewColor = CGColor(red: 100.0/255.0, green: 130.0/255.0, blue: 200/255.0, alpha: 1.0)
        topView.layer?.backgroundColor = CGColor.black
        
        profileView.wantsLayer = true
        profileView.layer?.cornerRadius = CGRectGetWidth(self.profileView.frame)/2
        dashboardBtn.contentTintColor = .systemTeal
    }
    
    @IBAction func onProfileBtn(_ sender: Any) {
        print("hii")
        performSegue(withIdentifier: k.Segue.editProfileSegue, sender: self)
    }
    
    
    @IBAction func onDashboard(_ sender: Any) {
        dashboardBtn.contentTintColor = .systemTeal
        allTaskBtn.contentTintColor = .white
        attendanceBtn.contentTintColor = .white
        hideContentController(content: taskVC)
        hideContentController(content: attendanceVC)
        
        addChild(dashboardVC)
        view.addSubview(dashboardVC.view)
        
        
    }
    
    @IBAction func onAllTask(_ sender: Any) {
        allTaskBtn.contentTintColor = .systemTeal
        dashboardBtn.contentTintColor = .white
        attendanceBtn.contentTintColor = .white
        
        hideContentController(content: dashboardVC)
        hideContentController(content: attendanceVC)
        
        addChild(taskVC)
        view.addSubview(taskVC.view)
        
        
    }
    
    @IBAction func onAttendence(_ sender: Any) {
        attendanceBtn.contentTintColor = .systemTeal
        allTaskBtn.contentTintColor = .white
        dashboardBtn.contentTintColor = .white
        
        hideContentController(content: dashboardVC)
        hideContentController(content: taskVC)
        
        addChild(attendanceVC)
        view.addSubview(attendanceVC.view)
        
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
