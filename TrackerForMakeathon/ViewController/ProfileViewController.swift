//
//  ProfileViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 03/01/23.
//

import Cocoa
import AppKit

class ProfileViewController: NSViewController {
    
    @IBOutlet var buttonView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.wantsLayer = true
        buttonView.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    @IBAction func onNameBtn(_ sender: Any) {
        k.showAllert(title: "Profile Details", message: "This feature is under development")
    }
    
    @IBAction func onInfostrideBtn(_ sender: Any) {
        k.showAllert(title: "INFOSTRIDE", message: "This feature is under development")
    }
    
    @IBAction func onSettingsBtn(_ sender: Any) {
        k.showAllert(title: "Settings", message: "This feature is under development")
    }
    
    

    @IBAction func onLogoutBtn(_ sender: Any) {
        print("Logout Tapped")
        if let signVC = self.storyboard?.instantiateController(withIdentifier: k.ViewController.signInVC) as? ViewController {
            self.view.window?.contentViewController = signVC
            if let container = self.storyboard?.instantiateController(withIdentifier: k.ViewController.containerVC) as? ContainerViewController {
                NSApplication.shared.terminate(self)
//                    let appDelegate = NSApplication.shared.delegate as! AppDelegate
//                    appDelegate.restart()

            }
            
        }
        
    }
    
}
