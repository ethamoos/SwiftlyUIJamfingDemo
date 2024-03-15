//
//  JamfBrain.swift
//  SwiftlyUIJamfingDemo
//
//  Created by Amos Deane on 01/06/2023.
//

import Foundation
import SwiftUI


class JamfBrain: ObservableObject {
    
    @Published var status: String = ""
    @Published var authToken = ""
    @Published var computers: [Computer] = []
    
    @Published var computersBasic: [Computers.ComputerResponse] = []
    @Published var allComputersBasic: ComputerBasic = ComputerBasic(computers: [])
//  var teams = [String: String]()
//        @Published var allComputersBasicDict = [ComputerBasicRecord: ComputerBasicRecord]()
        @Published var allComputersBasicDict = [ComputerBasicRecord]()

    
    enum NetError: Error {
        case couldntEncodeNamePass
        case badResponseCode
    }
    
    struct JamfProAuth: Decodable {
        let token: String
        let expires: String
    }
    
    struct ComputersReply: Codable {
        
        let computers: [Computer]
        static func decode(_ data: Data) -> Result<[Computer],Error> {
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(ComputersReply.self, from: data)
                print("ComputersReply Decoding succeeded")
                return .success(response.computers)
            } catch {
                return .failure(error)
            }
        }
    }
    
    func appendStatus(_ string: String) {
        DispatchQueue.main.async { // need to modify status on the main queue
            self.status += string
            self.status += "\n\n"
        }
    }
    
    func separationLine() {
        print("------------------------------------------------------------------")
    }
    func doubleSeparationLine() {
        print("==================================================================")
    }
    
    func asteriskSeparationLine() {
        print("******************************************************************")
    }
    func atSeparationLine() {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    }
    
    func connect(to server: String, as user: String, password: String, resourceType: ResourceType) {
        
        let resourcePath = getURLFormat(data: (resourceType))
        
        if let serverURL = URL(string: server) {
            let url = serverURL.appendingPathComponent("JSSResource").appendingPathComponent(resourcePath)
            print("Running connect function - url is set as:\(url)")
            print("resourceType is set as:\(resourceType)")
            request(url: url, as: user, password: password, resourceType: resourceType)
            appendStatus("Connecting to \(url)...")
        }
    }
    
    
    func debugSomething(dataThing: Any) {
        print("Printing out:\(dataThing)")
    }
    
    
    // This function generates the base64 from a user name and password
    func encodeBase64(user: String, password: String) -> String? {
        let authString = user + ":" + password
        let encoded = authString.data(using: .utf8)?.base64EncodedString()
        return encoded
    }
    
    // This function queries the Jamf Pro API for a authentication token
    func getToken(server: String, base64: String, callback: @escaping (String) -> ()) {
        print("Getting token")
        let tokenURLString = server + "/api/v1/auth/token"
        let url = URL(string: tokenURLString)!
        var request = URLRequest(url: url)
        //        print("Url is:\(url)")
        request.httpMethod = "POST"
        request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                //handle error
            } else if (response as? HTTPURLResponse)?.statusCode != 200 {
                //handle error
            } else {
                if let data = data {
                    if let auth = try? JSONDecoder().decode(JamfProAuth.self, from: data) {
                        print("We have a token")
                        
                        DispatchQueue.main.async {
                            self.authToken = auth.token
                            callback(auth.token)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    
    func processComputer(data: Data, response: URLResponse, resourceType: String) {
        
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print("Running: processComputer function")
        separationLine()
        let decoded = ComputersReply.decode(data)
        separationLine()
        //        print("Processed computers data is:")
        //        print(String(data: data, encoding: .utf8)!)
        //        print("Decoded is:\(decoded)")
        print("resourceType is:\(String(resourceType))")
        
        switch decoded {
        case .success(let computers):
            receivedComputers(computers: computers)
            //            print("Computers are:\(computers)")
            
        case .failure(let error):
            appendStatus("Corrupt data. \(response) \(error)")
        }
    }
    
    
    func request(url: URL, as user: String, password: String, resourceType: ResourceType) {
        
        atSeparationLine()
        print("Running request function - resourceType is set as:\(resourceType)")
        print("URL is set as:\(url)")
        atSeparationLine()
        
        let loginData = "\(user):\(password)".data(using: String.Encoding.utf8)
        let base64LoginString = loginData!.base64EncodedString()
        let headers = [
            "Accept": "application/json",
            "Authorization": "Basic \(base64LoginString)"
        ]
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response {
                
                self.separationLine()
                print("Running request")
                //                print("request data is:")
                //                print(String(data: data, encoding: .utf8)!)
                
                
                self.doubleSeparationLine()
                print("Doing processing of request")
                
                if resourceType == ResourceType.computer {
                    print("Resource type is set in request to computer")
                    self.processComputer(data: data, response: response, resourceType: "computer")
                }
                
            } else {
                var text = "\n\nFailed."
                if let error = error {
                    text += " \(error)."
                }
                self.appendStatus(text)
            }
        }
        dataTask.resume()
    }
    
    
    func receivedComputers(computers: [Computer]) {
        DispatchQueue.main.async {
            self.computers = computers
            self.status = "Computers retrieved"
        }
    }
    
    func getComputersBasic(server: String) async throws {
        let jamfURLQuery = server + "/JSSResource/computers/subset/basic"
        
        let url = URL(string: jamfURLQuery)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        separationLine()
        print("Running func: getComputersBasic")
        print("jamfURLQuery is: \(jamfURLQuery)")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Code not 200")
            throw NetError.badResponseCode
        }
        separationLine()
        print("processDetail Json data as text is:")
        print(String(data: data, encoding: .utf8)!)
        let decoder = JSONDecoder()
        
        
        self.allComputersBasic = try decoder.decode(ComputerBasic.self, from: data)
        
        DispatchQueue.main.async {
            
            self.allComputersBasicDict = self.allComputersBasic.computers
        }
    }
}


