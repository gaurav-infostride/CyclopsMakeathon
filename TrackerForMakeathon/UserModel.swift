//
//  UserModel.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 23/12/22.
//

import Foundation
import AppKit

struct AttendanceModel{
    
}

//TaskDataSource/Model
struct TaskDataModel{
    var taskArray:[TaskData] = []
}

struct TaskData{
    var timeAdded:Date?
    var taskName:String?
    var taskDiscription:String?
    var taskDoca:String?
    
}


struct LoginDataModel: Codable {
    let status, token: String?
    let expiresIn: Int?

    enum CodingKeys: String, CodingKey {
        case status, token
        case expiresIn = "expires_in"
    }
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        expiresIn = try container.decodeIfPresent(Int.self, forKey: .expiresIn)
        
    }
}




struct AuthenticationDataModel: Codable {
    let status, token: String?
    let expiresIn: Int?

    enum CodingKeys: String, CodingKey {
        case status, token
        case expiresIn = "expires_in"
    }
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        expiresIn = try container.decodeIfPresent(Int.self, forKey: .expiresIn)
        
    }
}
