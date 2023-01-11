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
    var taskModel : TaskDataModel?
    
    var authenticationData : AuthenticationDataModel?
    var loginData : LoginDataModel?
    
    
    func userLogin(email:String?, password:String?,completion:@escaping()->Void){
        // Prepare URL
        let url = URL(string: "http://10.20.1.70:4000/user/login")
        guard let requestUrl = url else { fatalError() }
        print("url ----> ",url)
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        if let email = email, let password = password{
            let postString = "email=\(String(describing: email))&password=\(String(describing: password))"; //"gourav@yopmail.com"   //"Gourav@1234"
            print(postString)
            
            // Set HTTP Request Body
            request.httpBody = postString.data(using: String.Encoding.utf8)
            // Perform HTTP Request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if (error != nil) {
                    print(error as Any)
                } else{
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let model = try decoder.decode(LoginDataModel.self, from: data)
                            
                            self.loginData = model
                            completion()
                            print(self.loginData)
                            // Save the model to your database or store it in a property
                        } catch {
                            print("Error decoding model: \(error)")
                        }
                    } else {
                        print("Error fetching data: \(error)")
                    }
                }
                
                
            }
            task.resume()
        }

    }
    
    
    func generateAuthenticationToken(completion:@escaping()->Void) {
        let headers = [
            "accept": "application/json",
            "dev-id": "prescribery-dev-gwLs26wh70",
            "x-api-key": "1052553f3dad2331689a46e524a7878d426a2c9bd3d8381a05a073288846adc0"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.tryterra.co/v2/auth/generateAuthToken")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else{
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let model = try decoder.decode(LoginDataModel.self, from: data)
                        
                        self.loginData = model
                        completion()
                        // Save the model to your database or store it in a property
                    } catch {
                        print("Error decoding model: \(error)")
                    }
                } else {
                    print("Error fetching data: \(error)")
                }
                
                
                //              let httpResponse = response as? HTTPURLResponse
                //              print(httpResponse)
                //              let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                //              print(outputStr)
            }
            
            
            //                // Check for Error
            //                if let error = error {
            //                    print("Error took place \(error)")
            //                    return
            //                }
            //
            //                // Convert HTTP Response Data to a String
            //                if let data = data, let dataString = String(data: data, encoding: .utf8) {
            //                    print("Response data string:\n \(dataString)")
            //                }
            
        })
        
        dataTask.resume()
    }
}
