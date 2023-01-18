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
    
    
    let viewModel = UserViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
                k.showAllert(title: "Email", message: "Please enter email address")
            return
        }
        guard idTextField.stringValue.isValidEmail() else  {
                k.showAllert(title: "Invalid Email", message: "Please enter a valid email address")
            return
        }
        guard passwordTextField.stringValue != ""   else  {
                k.showAllert(title: "Password", message: "Please enter password")
            return
        }
        guard passwordTextField.stringValue.count > 5  else  {
                k.showAllert(title: "Invlid Password", message: "Pasword must be greater than five digits")
            return
        }
        viewModel.userLogin(email: idTextField.stringValue, password: passwordTextField.stringValue) {
            guard let user = self.viewModel.loginData?.data?.user else{
                    k.showAllert(title: "Login Data", message: "Login data not found !")
                return
                
            }
            DispatchQueue.main.async {
                guard self.idTextField.stringValue == user.email ?? "" else{
                    print("IdTF",self.idTextField.stringValue)
                    print("Id",user.email ?? "")
                    return
                }
                guard self.passwordTextField.stringValue == user.password ?? "" else{
                    print("PassTF",self.passwordTextField.stringValue)
                    print("PASS",user.password ?? "")
                    return
                }
            }

            DispatchQueue.main.async {
                if let viewController = self.storyboard?.instantiateController(withIdentifier: k.ViewController.dashboardVC) as? DashboardViewController {
                    self.view.window?.contentViewController = viewController
                }
            }
            
            
        }
        
    }
}



//
//
//            let storyboard = NSStoryboard(name: k.Storyboard.main, bundle: nil)
////            let secondVC = NSStoryboardSegue.Identifier(k.ViewController.dashboard)
//            let viewController = storyboard.instantiateController(withIdentifier: k.ViewController.dashboard) as! NSViewController
//            self.present(viewController, asPopoverRelativeTo: .null, of: .init(), preferredEdge: .maxX, behavior: .transient)

//            self.performSegue(withIdentifier: k.dashboardSegue, sender: self)
