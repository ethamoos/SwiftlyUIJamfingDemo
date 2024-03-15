

import SwiftUI

struct ComputersBasicView: View {
    
    var selectedResourceType = ResourceType.computerBasic
    
    @State var server: String
    @State var user: String
    @State var password: String
    @State var computersBasic: [ComputerBasicRecord] = []
//    @State var selection: [Computers.ComputerResponse] = []
    @State var selection = Set<ComputerBasicRecord>()

    @EnvironmentObject var networkController: JamfBrain
    
    @State var currentDetailedPolicy: PolicyCodable? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if networkController.allComputersBasic.computers.count > 0 {
                NavigationView {
                    List(networkController.allComputersBasic.computers, id: \.self, selection: $selection) { computer in
                        NavigationLink(destination: ComputersBasicDetailedView(server: server, user: user,password: password, computer: computer)) {
                            
                            HStack {
                                Image(systemName: "desktopcomputer")
                                Text(computer.name ).font(.system(size: 12.0)).foregroundColor(.black)
                            }
                        }
                    }
                    Text("\(networkController.computers.count) total computers")
                }
                .navigationViewStyle(DefaultNavigationViewStyle())
            } else {
                ProgressView {
                    Text("Loading data")
                        .font(.title)
//                        .progressViewStyle(.horizontal)
                    
//                    Text("\(networkController.computers.count) total computers")

                }
                .padding()
                Spacer()
            }
        }
        .frame(minWidth: 200, minHeight: 100, alignment: .leading)

        .onAppear {
            
//            networkController.connect(to: server, as: user, password: password, resourceType: ResourceType.computerBasic)
            
            Task {
                
                do {
                    try await networkController.getComputersBasic(server: server)
                } catch {
                    print("Error fetching basic computers")
                    print(error)
                }
            }
            
        }
    }
    
    func handleConnect(resourceType: ResourceType) async {
        print("Running handleConnect. resourceType is set as:\(resourceType)")
        

        
    }
}
        
       
