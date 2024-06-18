//
//  MainView.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import SwiftUI

struct MainView: View {
    
    var selectedResourceType: ResourceType
    @State var server: String
    @State var user: String
    @State var password: String
    @State var computers: [Computer] = []
    @State var selection: [Computer] = []
    
    @EnvironmentObject var networkController: JamfBrain
        
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if networkController.computers.count > 0 {
                NavigationView {
                    List(networkController.computers, id: \.self, selection: $selection) { computer in
                        
                        NavigationLink(destination: MainViewDetailed(server: server, user: user,password: password, computer: computer, selectedResourceType: selectedResourceType)) {
                            
                            HStack {
//                                Image(systemName: "laptopcomputer")
                                Image(systemName: "apple.logo")
                                Text(computer.name).font(.system(size: 12.0)).foregroundColor(.black)
                            }
                        }
                    }
                    
                    Text("\(networkController.computers.count) total computers")
        
                }
                .navigationViewStyle(DefaultNavigationViewStyle())
            } else {
                ProgressView {
                    Text("Loading")
                        .font(.title)
            }
            padding()
            Spacer()
        }
    }
//        .frame(width: 800, height: 500, alignment: .leading)
        .onAppear {
            print("ComputerView appeared. Running onAppear")
            print("\(selectedResourceType) View appeared - connecting")
            print("Searching for \(selectedResourceType)")
            handleConnect(resourceType: ResourceType.computer)
            computers = networkController.computers
        }
    }
    
    func handleConnect(resourceType: ResourceType) {
        print("Running handleConnect. resourceType is set as:\(resourceType)")
        networkController.connect(to: server, as: user, password: password, resourceType: resourceType)
    }
}

