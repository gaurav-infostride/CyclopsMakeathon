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
    
    var workDuration : String?
    var breakDuration : String?
    
    var isViewTask : Bool?
    var attendanceData : AttendanceModel?
    var addTaskModel : AddTaskModel2?
    var getTaskModel : GetTaskModel?
    var updateTask : UpdateTaskModel?
    var punchInModel : PunchInModel?
    
    
    var loginData : LoginModel?
    var profileModel : ProfileModel?
    var punchDetailsModel : PunchDetailsModel?
    var punchOutModel : PunchOutModel?
    
    //Get Punch Details using bearer Token GET request
    func getPunchDetails(completion:@escaping()->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        
        //Prepare URL
        let url = URL(string: k.Url.punchDetailsUrl)
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
                    let data = try decoder.decode(PunchDetailsModel.self, from: data)
                    
                    if data.status == "SUCCESS" {
                        self.punchDetailsModel = data
                        print(self.punchDetailsModel)
//                        print("Punch Details SUCCESS--->",data)
                        completion()
                    }else if data.status == "FAIL"{
                        k.showAllert(title: "Punch Details Data !", message: data.error?.message ?? "Failed to get Punch Details Data")
                    }
                } catch {
                    k.showAllert(title: "Punch Details Data !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
            
            
        }
        task.resume()
        
    }
    
    //Update Punchin using bearer Token GET request
    func getPunchin(completion:@escaping(String)->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        
        //Prepare URL
        let url = URL(string: k.Url.punchInUrl)
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
                    let data = try decoder.decode(PunchInModel.self, from: data)
                    if data.status == "SUCCESS" {
                        self.punchInModel = data
                        print(self.punchInModel?.message)
                        print("Get PunchIn Data SUCCESS--->",self.punchInModel)
                        completion("SUCCESS")
                    }else if data.status == "FAIL"{
                        print(data)
                        completion("FAIL")
                        print(data.error?.message)
//                        k.showAllert(title: "PunchIn Data", message: data.error?.message ?? "PunchIn Failed !")
                    }
                } catch {
                    k.showAllert(title: "PunchIn Data", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
            
            
        }
        task.resume()
        
    }
    
    //Update PunchOut using bearer Token GET request
    func punchOut(punchInId:String?,duration:String?,completion:@escaping()->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        guard let safePunchInId = punchInId, let safeDuration = duration else {return}
        
        //HTTP Request Parameters which will be sent in HTTP Request Body
        let params = "id=\(safePunchInId)&description=\(safeDuration)";
        print("params--->",params)
        
        let url = URL(string: k.Url.punchOutUrl)
        guard let requestUrl = url else { fatalError() }
        //print("url ----> ",url)
        
        // Prepare URL Request Object //Set HTTP Request Body
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = params.data(using: String.Encoding.utf8)
         
        
        // Perform HTTP Request
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let data = try decoder.decode(PunchOutModel.self, from: data)
                    if data.status == "SUCCESS" {
                        self.punchOutModel = data
                        print("Punchout Success")
                        completion()
                    } else if data.status == "FAIL" {
                        k.showAllert(title: self.updateTask?.status ?? "", message: self.updateTask?.error?.message ?? "")
                    }else {
                        k.showAllert(title: "PunchOut Data ", message: "Please check PunchIn id")
                    }
                    
                } catch {
                    k.showAllert(title: "Error !", message: error.localizedDescription)
                    print("Error decoding model: \(error)")
                }
            }
        }
    }
    
    
    
    //Update task with parameters using bearer Token GET request
    func updateTask(id:String?, description:String?, completion:@escaping(String)->Void){
        guard let loginToken = loginData?.data?.token else{
            k.showAllert(title: "User Token", message: "User token not available")
            return
        }
        guard let safeId = id, let safeDescription = description else {return}
        
        //HTTP Request Parameters which will be sent in HTTP Request Body
        let params = "id=\(safeId)&description=\(safeDescription)";
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
                print("Error fetching data: \(error)")
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
        
        guard let safeTitle = taskTitle else { return }
        
        //Prepare URL
        let url = URL(string: k.Url.addTaskUrl)
        guard let requestUrl = url else { fatalError() }
        
        
        //Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(loginToken)", forHTTPHeaderField: "Authorization")
        
        //Parameters which will be sent in HTTP Request Body
        let params = "title=\(safeTitle)";
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
                        print(self.getTaskModel)
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
            let params = "email=\(email)&password=\(password)"; //"gourav@yopmail.com"   //"Gourav@1234"
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

