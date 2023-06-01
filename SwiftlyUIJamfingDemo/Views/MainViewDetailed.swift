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
    VStack(alignment: .leading, spacing: 2.0) {
        Text("Computer Name:\(computer.name)")
            .padding()
        Text("Computer ID:\(String(computer.id))")
            .padding()

    }
//    .multilineTextAlignment(.leading)
    .padding(.trailing, 10.0)
    .frame(width: 200.0)    }
}


//struct MainViewDetailed_Previews: PreviewProvider {
//    static var previews: some View {
//        MainViewDetailed(server: server, user: user, password: password, computer: computer, selectedResourceType: selectedResourceType)
//    }
//}
