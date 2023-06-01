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
