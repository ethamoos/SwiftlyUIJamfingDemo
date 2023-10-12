//
//  OptionsView.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var networkController: JamfBrain
    
    @State var prestageID = ""
    @State var serial = ""
    
    var server: String
    var user: String
    var password: String
    
    @Binding var selectedResourceType: ResourceType
    
  
    var body: some View {
        
        VStack {
            
            if networkController.computers.count > 0 {
                
                NavigationView {
                    List {
                        Section("Options") {
                            
                            NavigationLink(destination: MainView(selectedResourceType: ResourceType.computer, server: server, user: user, password: password)) {
                                Text("Computers")
                            }
                            
                            NavigationLink(destination: MainView(selectedResourceType: ResourceType.computer, server: server, user: user, password: password)) {
                                Text("Show")
                            }
                            
                            
                            NavigationLink(destination: ContentView(selectedResourceType: selectedResourceType, server: server, user: user, password: password)) {
                                Text("Login")
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .onAppear {
            handleConnect(resourceType: selectedResourceType)
        }
    }
    
    
    func handleConnect(resourceType: ResourceType) {
        print("Running handleConnect. resourceType is:\(resourceType)")
        networkController.connect(to: server, as: user, password: password, resourceType: resourceType)
    }
}

