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



