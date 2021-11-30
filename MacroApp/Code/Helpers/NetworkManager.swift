//
//  NetworkManager.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 29/11/21.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Network Manager")
    @Published var isConnected = true
    
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    
}
