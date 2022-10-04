//
//  NetworkConnection.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 29.09.2022.
//

import Network

class NetworkConnection {
    public static func networkConnectionControl(completion: @escaping (Bool) -> ()) {
            let monitor = NWPathMonitor()
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("NETWORK LOG: We're Connected!")
                    completion(true)
                } else {
                    print("NETWORK LOG: no connection.")
                    completion(false)
                }
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        }
}
