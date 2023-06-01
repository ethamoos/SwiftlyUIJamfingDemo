//
//  ResourcesEnums.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import Foundation


enum ResourceType {
    case computer

}

func getURLFormat(data: ResourceType) -> String {
    
    print("Getting URL format")
    
    switch data {
    case .computer:
        return "computers"
    }
}

func getProcessFormat(data: ResourceType) -> String {
    
    print("Getting Process format")
    
    switch data {
    case .computer:
        return "process"
    }
}



func getReplyString(data: ResourceType) -> String {
    
    print("Getting Reply format")
    
    switch data {
    case .computer:
        return "ComputersReply"
        
    }
}



func getSingleInstanceString(data: ResourceType) -> String {
    
    print("Getting Single Instance format")

    switch data {
    case .computer:
        return "Computer"
    }
}



func getReceivedString(data: ResourceType) -> String {
    
    print("Getting Received String format")
    
    switch data {
    case .computer:
        return "receivedComputers"
        
    }
}



