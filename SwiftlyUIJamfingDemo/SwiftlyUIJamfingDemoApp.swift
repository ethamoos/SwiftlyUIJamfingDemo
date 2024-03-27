//
//  SwiftlyUIJamfingDemoApp.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//



import SwiftUI

@main

struct SwiftlyUIJamfingDemoApp: App {
    
    let networkController: NetBrain
    
    init() {
        self.networkController = NetBrain()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(showLoginScreen: true)
                .environmentObject(networkController)
        }
    }
}

