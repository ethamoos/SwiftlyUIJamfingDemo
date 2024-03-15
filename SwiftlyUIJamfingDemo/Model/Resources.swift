//
//  Resources.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import Foundation


struct Computer: Codable, Identifiable,Hashable {
    let id: Int
    let name: String
    let serial_number: String?
}

struct ComputerDetailed: Codable {
    var computer: Computer
}



//          ################################################################################
//          MARK: - COMPUTERS
struct Computers: Codable {
    struct ComputerResponse: Codable, Identifiable, Hashable {
        var id = UUID()
        var jamfId: Int
        var name: String?
        var username: String?
        var realname: String?
        var serial_number: String
        var mac_address: String
        var alt_mac_address: String?
        var asset_tag: String?
        var ip_address: String?
        var last_reported_ip: String?
//        var location: Location?
        
        enum CodingKeys:String, CodingKey{
            case jamfId = "id"
            case name = "name"
            case username = "username"
            case realname = "realname"
            case serial_number = "serial_number"
            case mac_address = "mac_address"
            case alt_mac_address = "alt_mac_address"
            case asset_tag = "asset_tag"
            case ip_address = "ip_address"
            case last_reported_ip = "last_reported_ip"
//            case location = "location"
        }
    }
    var computersBasic: [ComputerResponse]
    
}



// MARK: - ComputerBasic
struct ComputerBasic: Codable {
    let computers: [ComputerBasicRecord]
}

// MARK: - Computer
struct ComputerBasicRecord: Codable, Hashable {
    let id: Int
    let name: String
    let managed: Bool
    let username, model, department, building: String
    let macAddress, udid, serialNumber, reportDateUTC: String
    let reportDateEpoch: Int

    enum CodingKeys: String, CodingKey {
        case id, name, managed, username, model, department, building
        case macAddress = "mac_address"
        case udid
        case serialNumber = "serial_number"
        case reportDateUTC = "report_date_utc"
        case reportDateEpoch = "report_date_epoch"
    }
}




// MARK: - Policies

struct Policies: Codable, Hashable, Identifiable {
    var id = UUID()
    var jamfId: Int?
    var name: String
    enum CodingKeys:String, CodingKey{
        case jamfId = "id"
        case name = "name"
    }
}

struct PolicyCodable: Codable, Hashable {
    let policy: Policy }

//struct Policy: Codable, Hashable, Identifiable {
//
//struct PolicyCodable: Codable{
//    let policy: Policy }

struct Policy: Codable, Hashable, Identifiable {
    var id = UUID()
    let general: General?
    //    let serialsByPrestageID: [String: String]
    
    let scope: Scope?
    let package_configuration: PackageConfiguration?
    //    let scripts: [PolicyScripts]?
    //    let printers: [PrinterElement]?
    //    let files_processes: FilesProcesses?
    //    let printer:[PrinterClass]?
    
    enum CodingKeys: String, CodingKey {
        case general = "general"
        case scope = "scope"
        case package_configuration = "package_configuration"
        //        case scripts = "scripts"
        //        case printers = "printers"
        //        case files_processes = "files_processes"
        //        case printer
    }
    
}


struct Package: Codable, Hashable, Identifiable {
    var id = UUID()
    var jamfId: Int
    var name: String
    var udid: String?
    enum CodingKeys: String, CodingKey {
        case jamfId = "id"
        case name = "name"
        case udid = "udid"
    }
}


// MARK: - PackageConfiguration
struct PackageConfiguration: Codable, Hashable, Identifiable  {
    var id = UUID()
    let packages: [Package]
    enum CodingKeys: String, CodingKey {
        case packages = "packages"
    }
}




struct General: Codable, Hashable, Identifiable {
    var id = UUID()
    let jamfId: Int?
    let name: String?
    let enabled: Bool?
    let trigger: String?
    let triggerCheckin, triggerEnrollmentComplete, triggerLogin, triggerLogout: Bool?
    let triggerNetworkStateChanged, triggerStartup: Bool?
    let triggerOther, frequency: String?
    let locationUserOnly: Bool?
    let targetDrive: String?
    let offline: Bool?
//        let category: Category?
    //    let dateTimeLimitations: DateTimeLimitations?
    //    let networkLimitations: NetworkLimitations?
    //    let overrideDefaultSettings: OverrideDefaultSettings?
    let networkRequirements: String?
    //    let site: Category?
    let mac_address: String?
    let ip_address: String?
    let payloads: String?
    
    enum CodingKeys: String, CodingKey {
        case jamfId = "id"
        case name = "name"
        case enabled = "enabled"
        case trigger = "trigger"
        case triggerCheckin = "trigger_checkin"
        case triggerEnrollmentComplete = "trigger_enrollment_complete"
        case triggerLogin = "trigger_login"
        case triggerLogout = "trigger_logout"
        case triggerNetworkStateChanged = "trigger_network_state_changed"
        case triggerStartup = "trigger_startup"
        case triggerOther = "trigger_other"
        case frequency = "frequency"
        case locationUserOnly = "location_user_only"
        case targetDrive = "target_drive"
        case offline = "offline"
//                case category = "category"
        //        case dateTimeLimitations = "date_time_limitations"
        //        case networkLimitations = "network_limitations"
        //        case overrideDefaultSettings = "override_default_settings"
        case networkRequirements = "network_requirements"
        //        case site = "site"
        case mac_address = "mac_address"
        case ip_address = "ip_address"
        case payloads = "payloads"
    }
}


//MARK: - PRINTER
struct Printers: Codable, Hashable, Identifiable {
    var id = UUID()
    var any: String?
    var printer: Result?
    struct Result: Codable, Hashable, Identifiable {
        var id = UUID()
        var jamfId: Int?
        var name: String?
        var makeDefault: Bool?
        
        enum CodingKeys: String, CodingKey {
            case jamfId = "id"
            case name = "name"
            case makeDefault = "makeDefault"
        }
    }
}


// MARK: - PolicyScripts
struct PolicyScripts: Codable, Hashable, Identifiable {
    var id = UUID()
    var jamfId: Int?
    var name: String?
    var priority: String?
    enum CodingKeys: String, CodingKey {
        case jamfId = "id"
        case name = "name"
        case priority = "priority"
    }
}

//MARK: - FileProcesses

struct FilesProcesses:Codable, Hashable, Identifiable {
    var id = UUID()
    var run_command:String?
    enum CodingKeys: String, CodingKey {
        case run_command = "run_command"
    }
}

// MARK: - Reboot
struct Reboot: Codable, Hashable, Identifiable  {
    var id = UUID()
    let message, startupDisk, specifyStartup, noUserLoggedIn: String?
    let userLoggedIn: String?
    let minutesUntilReboot: Int?
    let startRebootTimerImmediately, fileVault2_Reboot: Bool?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case startupDisk = "startup_disk"
        case specifyStartup = "specify_startup"
        case noUserLoggedIn = "no_user_logged_in"
        case userLoggedIn = "user_logged_in"
        case minutesUntilReboot = "minutes_until_reboot"
        case startRebootTimerImmediately = "start_reboot_timer_immediately"
        case fileVault2_Reboot = "file_vault2_reboot"
    }
}

// MARK: - Scope
struct Scope: Codable, Hashable, Identifiable  {
    var id = UUID()
    let allComputers: Bool?
   
    
    enum CodingKeys: String, CodingKey {
        case allComputers = "all_computers"
      
    }
}


struct GenericItem: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String?
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}


// MARK: - Location
struct Location: Codable, Identifiable, Hashable {
    var id = UUID()
    var username, realname, emailAddress: String?
    var position, phone, phoneNumber, department: String?
    var building, room: String?
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case realname = "realname"
        case emailAddress = "emailAddress"
        case position = "position"
        case phone = "phone"
        case phoneNumber = "phone_number"
        case department = "department"
        case building = "building"
        case room = "room"
    }
}
