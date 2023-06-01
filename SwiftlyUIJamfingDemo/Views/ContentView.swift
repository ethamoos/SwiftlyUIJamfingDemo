//
//  ContentView.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkController: JamfBrain
    
//  Set a default view
    @State var selectedResourceType:ResourceType = ResourceType.computer
//  Variable to control current view
    @State private var hasLoggedInView: String? = nil

    
    @AppStorage("server") var server = ""
    @AppStorage("user") var user = ""
    @AppStorage("password") var password = ""

    @State var showLoginScreen = true
    
    var body: some View {
        if showLoginScreen {
            LoginView(selectedResourceType: $selectedResourceType, showLoginScreen: $showLoginScreen)
        } else {
            OptionsView(server: server, user: user, password: password, selectedResourceType: $selectedResourceType )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
