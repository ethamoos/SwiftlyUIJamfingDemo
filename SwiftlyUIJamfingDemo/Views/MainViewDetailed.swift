//
//  MainViewDetailed.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//
import SwiftUI

struct MainViewDetailed: View {

    var server: String
    var user: String
    var password: String
    @State var computer: Computer

    
    var selectedResourceType: ResourceType

    
    
var body: some View {
    VStack(alignment: .leading) {
        Text("Computer Name:\(computer.name)")
        Text("Computer ID:\(String(computer.id))")


        
//            Text("Computer UDID:\(computer.udid ?? "No UDID")")
    }
//        .multilineTextAlignment(.leading)
    .padding()    }
}


