//
//  NetworkManager.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 23.05.2023.
//

import Foundation
import Network


class NetworkManager: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkManager")
    var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        monitor.start(queue: queue)
    }
}
