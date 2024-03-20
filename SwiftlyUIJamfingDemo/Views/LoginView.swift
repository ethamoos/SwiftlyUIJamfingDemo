//
//  LoginView.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import SwiftUI
import os.log


struct LoginView: View {
    
    @State var currentToken = "test"
    
    @Binding var selectedResourceType: ResourceType
    
    @State private var hasLoggedInView: String? = nil
    
    @Binding var showLoginScreen: Bool
    
    //    List possible outcomes - the . refers to the cases of the enum ResourceType
    let resourceCaseList = [ ResourceType.computer]
    
    @AppStorage("server") var server = ""
    @AppStorage("user") var user = ""
    @AppStorage("password") var password = ""
    
    @EnvironmentObject var networkController: JamfBrain
    
    var body: some View {
        
        
        VStack(alignment: .trailing){
            
            VStack(alignment: .leading, spacing: 7.0) {
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    HStack() {
                        Spacer()
                        Label("server", systemImage: "globe")
                    }
                    
                    TextField("server", text: $server)
                        .padding()
                    
                    HStack() {
                        Spacer()
                        Label("user", systemImage: "person")
                    }
                    
                    TextField("user", text: $user)
                        .padding()
                    
                    HStack {
                        Spacer()
                        Label("password", systemImage: "ellipsis.rectangle")
                    }
                    
                    SecureField("password", text: $password)
                        .padding()
                    
                        .multilineTextAlignment(.trailing)
                    
//                    HStack {
//                        Spacer()
//                        Label("Resource", systemImage: "xserve")
//                    }
//                    
//                    Picker("", selection: $selectedResourceType) {
//                        ForEach(resourceCaseList, id: \.self) {
//                            Text(String(describing: $0))
//                        }
//                        .padding([.leading,.trailing, .bottom])
//                    }
                    
                    HStack {
                        Spacer()
                        Label("Proceed", systemImage: "tortoise")
                    }
                    
                    Button(action: {
                        showLoginScreen = false
                    }) {
                        HStack() {
                            Text("Go")
                        }
                        .padding([.leading,.trailing, .bottom])
                    }
                    .padding()
                }
            }
            .frame(width: 500, height: 100,alignment: .leading)
        }
    }
}

