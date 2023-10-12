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
    
    @State var selectedResourceType: ResourceType = ResourceType.computerDetailed
    @State var computer: Computer
    @State var url: URL? = nil
    
    @EnvironmentObject var networkController: JamfBrain

    
    func setURL(objectID: Int, resourcePath: ResourceType, server: String) {
        
        networkController.separationLine()
        print("Setting the URL for resource type: \(selectedResourceType)")
        
        let resourcePath = getURLFormat(data: (selectedResourceType))
        
        if let serverURL = URL(string: server) {
                        
            url = serverURL.appendingPathComponent("JSSResource").appendingPathComponent(resourcePath).appendingPathComponent("\(objectID)")
            
            print("URL is set as:\(String(describing: url))")
            
        } else {
            print("No url has been supplied")
        }

        }
    
    var body: some View {
        
                
        VStack(alignment: .leading) {
            Text("Computer Name:\(computer.name)")
                .padding()
            Text("Computer ID:\(String(computer.id))")
                .padding()
            
            VStack {
                
                Button(action: {JamfBrain.loadFileAsync(url: url!, user: user, password: password) { (path, error) in}}) {
                    
                    Text("Download File")
                }
            }
            
        }
        //        .padding()    }
        .onAppear() {
            setURL(objectID: (computer.id), resourcePath: selectedResourceType, server: server)
            print("Item selected is:\(computer.id)")
        }
    }
}


//struct MainViewDetailed_Previews: PreviewProvider {
//    static var previews: some View {
//        MainViewDetailed(server: server, user: user, password: password, computer: computer, selectedResourceType: selectedResourceType)
//    }
//}
