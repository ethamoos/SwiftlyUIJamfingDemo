//
//  ResourcesEnums.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import Foundation


enum ResourceType {
    case computer
    case computerDetailed
    
    
}

func getURLFormat(data: ResourceType) -> String {
    
    print("Getting URL format")
    
    switch data {
    case .computer:
        return "computers"
        
    case .computerDetailed:
        return "computers/id/"
    }
}

func getProcessFormat(data: ResourceType) -> String {
    
    print("Getting Process format")
    
    switch data {
    case .computer:
        return "process"
        
    case .computerDetailed:
        return "process"
    }
}



func getReplyString(data: ResourceType) -> String {
    
    print("Getting Reply format")
    
    switch data {
    case .computer:
        return "ComputersReply"
    case .computerDetailed:
        return "ComputerDetailedReply"
        
    }
}



func getSingleInstanceString(data: ResourceType) -> String {
    
    print("Getting Single Instance format")
    
    switch data {
    case .computer:
        return "Computer"
    case .computerDetailed:
        return "ComputerDetailed"
    }
}



func getReceivedString(data: ResourceType) -> String {
    
    print("Getting Received String format")
    
    switch data {
    case .computer:
        return "receivedComputers"
    case .computerDetailed:
        return "receivedComputersDetailed"
        
    }
}



