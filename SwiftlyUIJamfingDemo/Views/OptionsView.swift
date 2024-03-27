//
//  OptionsView.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var networkController: NetBrain
    
    @State var prestageID = ""
    @State var serial = ""
    
    var server: String
    var user: String
    var password: String
    @Binding var selectedResourceType: ResourceType
    
    @State var showLoginScreen: Bool
    
  
    var body: some View {
        
        if !showLoginScreen {
            
            
            VStack {
                
                
                
                if networkController.computers.count > 0 {
                    
                    NavigationView {
                        List {
                            Section("Options") {
                                
                                NavigationLink(destination: MainView(selectedResourceType: ResourceType.computer, server: server, user: user, password: password)) {
                                    Text("Computers")
                                }
                                
                                NavigationLink(destination: ComputersBasicView(selectedResourceType: ResourceType.computer, server: server, user: user, password: password)) {
                                    Text("Computers Basic")
                                }
                                
                                //                            NavigationLink(destination: MainView(selectedResourceType: ResourceType.computer, server: server, user: user, password: password)) {
                                //                                Text("Show")
                                //                            }
                                
                                
                                NavigationLink(destination: ContentView(selectedResourceType: selectedResourceType, server: server, user: user, password: password, showLoginScreen: true
                                                                       )) {
                                    Text("Login")
                                }
                            }
                        }
                    }
                }
                //            }
            }
            .listStyle(.sidebar)
            .onAppear {
                handleConnect(resourceType: selectedResourceType)
            }
        }
    }
    
    
    func handleConnect(resourceType: ResourceType) {
        print("Running handleConnect. resourceType is:\(resourceType)")
        networkController.connect(to: server, as: user, password: password, resourceType: resourceType)
    }
}

