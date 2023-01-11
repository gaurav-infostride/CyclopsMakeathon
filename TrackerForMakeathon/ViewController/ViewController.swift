//
//  ViewController.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 14/12/22.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var loginStackView: NSStackView!
    @IBOutlet weak var idTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    
    
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Create a background view with a red background color
//        let backgroundView = NSView(frame: loginStackView.bounds)
//        backgroundView.wantsLayer = true
//        backgroundView.layer?.backgroundColor = NSColor.red.cgColor
//
//        // Add the background view to the stack view
//        loginStackView.addSubview(backgroundView, positioned: .below, relativeTo: loginStackView.subviews.last)


        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func onForgotPasswword(_ sender: Any) {
        
    }
    
    @IBAction func onSignIn(_ sender: Any){
        guard idTextField.stringValue != ""  else  {
            print("Please enter email address")
            //            alertMessage(title: "Email Address", message: "Please enter email address", preferredStyle: .alert)
            return
        }
        guard idTextField.stringValue.isValidEmail() else  {
            print("Please enter a valid email address")
            //            alertMessage(title: "Invalid Email Address", message: "Please enter a valid email address", preferredStyle: .alert)
            return
        }
        guard passwordTextField.stringValue != ""   else  {
            print("Please enter password")
            //            alertMessage(title: "Password", message: "Please enter password", preferredStyle: .alert)
            return
        }
        guard passwordTextField.stringValue.count > 5  else  {
            print("Please enter a valid password")
            //            alertMessage(title: "Invlid Password", message: "Your pasword must be greater than five digits", preferredStyle: .alert)
            //            alertMessage(title: "Invlid Password", message: "Please enter a valid password", preferredStyle: .alert)
            return
        }
        if let viewController = self.storyboard?.instantiateController(withIdentifier: k.ViewController.containerVC) as? ContainerViewController {
            self.view.window?.contentViewController = viewController
        }
//        }
    }
}



//        viewModel.userLogin(email: idTextField.stringValue, password: passwordTextField.stringValue) {
//
//            let storyboard = NSStoryboard(name: k.Storyboard.main, bundle: nil)
////            let secondVC = NSStoryboardSegue.Identifier(k.ViewController.dashboard)
//            let viewController = storyboard.instantiateController(withIdentifier: k.ViewController.dashboard) as! NSViewController
//            self.present(viewController, asPopoverRelativeTo: .null, of: .init(), preferredEdge: .maxX, behavior: .transient)

//            self.performSegue(withIdentifier: k.dashboardSegue, sender: self)
