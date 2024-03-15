//
//  ComputerDetail.swift
//  Manifesto
//
//  Created by Amos Deane on 29/03/2023.
//

import SwiftUI




struct ComputersBasicDetailedView: View {
    
    var server: String
    var user: String
    var password: String
    
    
    //    @State private var selection: Computers.ComputerResponse? = nil
    
    @State var computer: ComputerBasicRecord
    
    //    @State private var computers: [ Computers.ComputerResponse ] = []
    
    @State private var showingWarning = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            //            Text(package.udid ?? "")
            Text("Computer Name:\(computer.name)")
            Text("Computer UDID:\(computer.udid)")
            Text("Computer ID:\(computer.id)")
            Text("Primary User:\(computer.username)")
            Text("Department:\(computer.department)")
            Text("Building:\(computer.building)")
            Text("Computer Model:\(String(computer.model))")
            Text("Last checkin:\(String(computer.reportDateUTC))")
//            Text("Last checkin2:\(String(computer.reportDateEpoch))")
            Text("Serial Number:\(computer.serialNumber )")
            
            Button(action: {
                print("Delete")
                showingWarning = true
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "delete.left.fill")
                    Text("Delete")
                }
            }
            .alert(isPresented: $showingWarning) {
                           Alert(title: Text("Caution!"), message: Text("This action will delete data.\n Always ensure that you have a backup!"), dismissButton: .default(Text("I understand!")))
                       }
            //            let username, model, department, building: String
            //            let macAddress, udid, serialNumber, reportDateUTC: String
            //            let reportDateEpoch: Int
            //
            //            enum CodingKeys: String, CodingKey {
            //                case id, name, managed, username, model, department, building
            //                case macAddress = "mac_address"
            //                case udid
            //                case serialNumber = "serial_number"
            //                case reportDateUTC = "report_date_utc"
            //                case reportDateEpoch = "report_date_epoch"
        }
        .padding()
//    }
    //}
    //        .multilineTextAlignment(.leading)
    }

}

//struct ComputerDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComputerDetail()
//    }
//}
