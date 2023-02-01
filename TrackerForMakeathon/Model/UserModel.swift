//
//  UserModel.swift
//  TrackerForMakeathon
//
//  Created by Gaurav Kumar on 23/12/22.
//

import Foundation
import AppKit


// MARK: - PunchOutModel
struct PunchOutModel: Codable {
    let data: PunchOutDetails?
    let status, message: String?
    let error : Error?
}

// MARK: - WelcomeData
struct PunchOutDetails: Codable {
    let data: PunchOutData?
}

// MARK: - DataData
struct PunchOutData: Codable {
    let id, user, startTime, endTime: String?
    let workingHours, punchInDate, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user, startTime, endTime, workingHours, punchInDate, createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - PunchDetailsModel
struct PunchDetailsModel: Codable {
    let data: PunchDetails?
    let status, message: String?
    let error : Error?
}

// MARK: - DataClass
struct PunchDetails: Codable {
    let data: [PunchData]?
}

// MARK: - Datum
struct  PunchData: Codable {
    let id, user, startTime, endTime: String?
    let workingHours, punchInDate, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user, startTime, endTime, workingHours, punchInDate, createdAt, updatedAt
        case v = "__v"
    }
}



// MARK: - PunchInModel
struct PunchInModel: Codable {
    let data: PunchInDetails?
    let status, message: String?
    let error : Error?
}

// MARK: - WelcomeData
struct PunchInDetails: Codable {
    let data: PunchInData?
}

// MARK: - DataData
struct PunchInData: Codable {
    let user, startTime, endTime, workingHours: String?
    let id, punchInDate, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case user, startTime, endTime, workingHours
        case id = "_id"
        case punchInDate, createdAt, updatedAt
        case v = "__v"
    }
}



// MARK: - UpdateTaskModel
struct UpdateTaskModel: Codable {
    let status, message: String?
    let data: UpdateTask?
    let error : Error?
}

// MARK: - UpdateTask
struct UpdateTask: Codable {
    let data: Task?
}

// MARK: - Error
struct Error: Codable {
    let code: Int?
    let message, stack: String?
}

// MARK: - Welcome
struct GetTaskModel: Codable {
    let data: GetTask?
    let status, message: String?
}

// MARK: - DataClass
struct GetTask: Codable {
    let task: [Task]?
}


// MARK: - Welcome
struct AddTaskModel2: Codable {
    let data: TaskData2?
    let status, message: String?
}

// MARK: - DataClass
struct TaskData2: Codable {
    let task: Task?
}

// MARK: - Task
struct Task: Codable {
    let userID, title, description: String?
    let submited: Bool?
    let photos: [String]?
    let id, date, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case title, description, submited, photos
        case id = "_id"
        case date, createdAt, updatedAt
        case v = "__v"
    }
}



// MARK: - LoginModel
struct LoginModel: Codable {
    let status, message: String?
    let data: Data?
}

// MARK: - Data
struct Data: Codable {
    let user: User?
    let token: String
}



// MARK: - ProfileModel
struct ProfileModel: Codable {
    let data: Profile?
    let status, message: String?
}

// MARK: - Profile
struct Profile: Codable {
    let user: User?
}

// MARK: - UserProfile
struct User: Codable {
    let id, email, password, firstName: String?
    let lastName, phone: String?
//    let dateOfBirth: JSONNull?
    let employeeCode, designation, department, location: String?
    let shiftTiming, profilePicture: String?
//    let reportingManager: String?
//    let reportingManager: ReportingManager?
    let isPunchedIn: Bool?
    let isManager: Bool?
    let status, dateOfJoining, createdAt, updatedAt: String?
    let v: Int?
    let managerName: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, password, firstName, lastName, phone, employeeCode, designation, department, location, shiftTiming, profilePicture, isManager, status, dateOfJoining, createdAt, updatedAt
        case v = "__v"
        case managerName, isPunchedIn
    }
}
// MARK: - ReportingManager
struct ReportingManager: Codable {
    let id, firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName
    }
}






// MARK: - User
//struct User: Codable {
//    let id, email, password, firstName: String?
//    let lastName, phone: String?
////    let dateOfBirth: JSONNull?
//    let employeeCode, designation, department, location: String?
//    let shiftTiming, profilePicture, reportingManager: String?
//    let isManager: Bool?
//    let status, dateOfJoining: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case email, password, firstName, lastName, phone, employeeCode, designation, department, location, shiftTiming, profilePicture, reportingManager, isManager, status, dateOfJoining
//    }
//}














struct AttendanceModel{
    
}


var taskModel = TaskDataModel()
//TaskDataSource/Model
struct TaskDataModel{
    var taskArray:[TaskData] = []
}
struct TaskData{
    var timeAdded:Date?
    var taskName:String?
    var taskDiscription:String?
    var taskDoca:String?
    init(timeAdded: Date?, taskName: String?,taskDiscription:String?,taskDoca:String?) {
        self.timeAdded = timeAdded
        self.taskName = taskName
        self.taskDiscription = taskDiscription
        self.taskDoca = taskDoca
    }
}


//TaskDataSource/Model
struct TaskDataModelc{
    var taskArray:[TaskData] = []
}

struct TaskDatac{
    
    
}


//struct LoginDataModel: Codable {
//    let status, token: String?
//    let expiresIn: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case status, token
//        case expiresIn = "expires_in"
//    }
//    init(from decoder: Decoder) throws {
//        
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        status = try container.decodeIfPresent(String.self, forKey: .status)
//        token = try container.decodeIfPresent(String.self, forKey: .token)
//        expiresIn = try container.decodeIfPresent(Int.self, forKey: .expiresIn)
//        
//    }
//}




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
//// MARK: - UpdateTaskModel
//struct UpdateTaskModel: Codable {
//    let data: UpdateTask?
//    let status, message: String?
//}
//
//// MARK: - UpdateTask
//struct UpdateTask: Codable {
//    let task: [Task]?
//}
