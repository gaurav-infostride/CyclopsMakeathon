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
    }
    
    @IBAction func onInfostrideBtn(_ sender: Any) {
    }
    
    @IBAction func onSettingsBtn(_ sender: Any) {
    }
    
    
//    func restartApplication () {
//        let viewController = V()
//        let navCtrl = UINavigationController(rootViewController: viewController)
//
//        guard
//            let window = UIApplication.shared.keyWindow,
//            let rootViewController = window.rootViewController
//
//        else {
//            return
//        }
//
//        navCtrl.view.frame = rootViewController.view.frame
//        navCtrl.view.layoutIfNeeded()
//
//        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
//            window.rootViewController = navCtrl
//        })
//    }

    
    @IBAction func onLogoutBtn(_ sender: Any) {
        print("hii")
        if let signVC = self.storyboard?.instantiateController(withIdentifier: k.ViewController.signInVC) as? ViewController {
            self.view.window?.contentViewController = signVC
            if let container = self.storyboard?.instantiateController(withIdentifier: k.ViewController.containerVC) as? ContainerViewController {
//                self.dismiss(container)
                //                self.view.window?.contentViewController = container
            }
            
        }
        
    }
    
    
    
}
