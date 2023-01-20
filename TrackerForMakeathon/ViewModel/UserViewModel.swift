//
//  UserViewModel.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 23/12/22.
//

import Foundation

class UserViewModel {
    class var shared:UserViewModel{
        struct Singleton{
            static let instance =  UserViewModel()
        }
        return Singleton.instance
    }
    
    
    var attendanceData : AttendanceModel?
    var addTaskModel : AddTaskModel2?
    var getTaskModel : GetTaskModel?
    var updateTask : UpdateTaskModel?
    
    
    var loginData : LoginModel?
    var profileModel : ProfileModel?
    
    
    //Update task with parameters using bearer Token GET request
    func updateTask(id:String, description:String, completion:@escaping(String)->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        //HTTP Request Parameters which will be sent in HTTP Request Body
        let params = "id=\(String(describing: id))&description=\(String(describing: description))"; //"gourav@yopmail.com"   //"Gourav@1234"
        print("params--->",params)
        
        let url = URL(string: k.Url.updateTaskUrl)
        guard let requestUrl = url else { fatalError() }
        //print("url ----> ",url)
        
        // Prepare URL Request Object //Set HTTP Request Body
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = params.data(using: String.Encoding.utf8)
         
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode(UpdateTaskModel.self, from: data)
                    self.updateTask = data
                    if self.updateTask?.status == "SUCCESS" {
                        print("UpdateTask SUCCESS--->",data)
                        completion("SUCCESS")
                    }else if self.updateTask?.status == "FAIL"{
                        print("UpdateTask FAIL--->",data)
                        print(self.updateTask?.error?.message)
                        print(data.status)
                        completion("FAIL")
                        k.showAllert(title: self.updateTask?.status ?? "", message:  self.updateTask?.error?.message ?? "" )
                    }else{
                        k.showAllert(title: "Update Task", message: "Please check task id")
                    }
                } catch {
                    k.showAllert(title: "Error !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            } else {
                k.showAllert(title: "Data not found !", message: "Login data not found!")
                print("Error fetching data: \(String(describing: error))")
            }
            
            
        }
        task.resume()
        
    }
    
    //Update task with parameters using bearer Token GET request
    func addTask(taskTitle:String?, completion:@escaping()->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            
            return
        }
        
        //Prepare URL
        let url = URL(string: k.Url.addTaskUrl)
        guard let requestUrl = url else { fatalError() }
        
        
        //Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
        
        //Parameters which will be sent in HTTP Request Body
        let params = "title=\(String(describing: taskTitle))";
        print("params--->",params)
        
        // Sending Parameters HTTP Request Body
        request.httpBody = params.data(using: String.Encoding.utf8)
       
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode(AddTaskModel2.self, from: data)
                    self.addTaskModel = data
                    if self.addTaskModel?.status == "SUCCESS" {
                        print("AddTask SUCCESS--->",data)
                        completion()
                    }else{
                        k.showAllert(title: "Profile Data !", message: "Failed to get Profile Data")
                    }
                } catch {
                    k.showAllert(title: "Profile Data !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
            
            
        }
        task.resume()
        
    }
    
    
    //Update task with parameters using bearer Token GET request
    func getTask(completion:@escaping()->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        
        //Prepare URL
        let url = URL(string: k.Url.getTaskUrl)
        guard let requestUrl = url else { fatalError() }
        
        
        //Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
       
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode(GetTaskModel.self, from: data)
                    self.getTaskModel = data
                    if self.getTaskModel?.status == "SUCCESS" {
                        print("GetTask SUCCESS--->",data)
                        completion()
                    }else{
                        k.showAllert(title: "Profile Data !", message: "Failed to get Profile Data")
                    }
                } catch {
                    k.showAllert(title: "Profile Data !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
            
            
        }
        task.resume()
        
    }
    
    
 
    
    
    

    //Get profile data using bearer Token GET request
    func getProfileData(completion:@escaping()->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            
            return
        }
        
        //Prepare URL
        let url = URL(string: k.Url.profileUrl)
        guard let requestUrl = url else { fatalError() }
        
        
        //Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode(ProfileModel.self, from: data)
                    self.profileModel = data
                    if self.profileModel?.status == "SUCCESS" {
                        print("GetProfile SUCCESS--->",data)
                        completion()
                    }else{
                        k.showAllert(title: "Profile Data !", message: "Failed to get Profile Data")
                    }
                } catch {
                    k.showAllert(title: "Profile Data !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
            
            
        }
        task.resume()
        
    }
    
    
    
    //User Login using id an password POST Request
    func userLogin(email:String?, password:String?,completion:@escaping()->Void){
        // Prepare URL http://10.20.1.70:8000/user/login
        let url = URL(string: k.Url.loginUrl)
        guard let requestUrl = url else { fatalError() }
        //        print("url ----> ",url)
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        if let email = email, let password = password{
            let params = "email=\(String(describing: email))&password=\(String(describing: password))"; //"gourav@yopmail.com"   //"Gourav@1234"
            print("params--->",params)
            
            // Set HTTP Request Body
            request.httpBody = params.data(using: String.Encoding.utf8)
            // Perform HTTP Request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(LoginModel.self, from: data)
                        self.loginData = data
                        //                        print("Login Data",self.loginData?.data?.user)
                        if self.loginData?.status == "SUCCESS" {
                            print("Login SUCCESS--->",data)
                            completion()
                        }else{
                            //                            print("Login Failed !")
                            k.showAllert(title: "Login Failed !", message: "Please check email and password")
                        }
                    } catch {
                        k.showAllert(title: "Login Failed !", message: error.localizedDescription)
                        print("Error decoding model: \(error)")
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
    
    
   
    
    
}
