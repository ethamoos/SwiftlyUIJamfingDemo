//
//  SwiftlyUIJamfingDemoApp.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//



import SwiftUI

@main

struct SwiftlyUIJamfingDemoApp: App {
    
    let networkController: JamfBrain
    
    init() {
        self.networkController = JamfBrain()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkController)
        }
    }
}

