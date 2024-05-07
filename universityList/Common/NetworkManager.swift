//
//  NetworkManager.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation
import Reachability

/// A singleton class to manage network reachability status.
/// It uses the Reachability library to monitor the network status.
class NetworkManager {
    static let shared = NetworkManager()
    
    private let reachability = try? Reachability()

    private init() {
        startMonitoring()
    }
    
    /// Checks if the device is connected to the internet.
    /// - Returns: A boolean value indicating if the device is connected to the internet.
    func isReachable() -> Bool {
        return reachability?.connection != .unavailable
    }
    
    /// Sends a request to the specified URL and decodes the response to the specified type.
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - completion: An escaping closure that is called when the request is completed.
    func sendRequest<T: Decodable>(url: URL, completion: @escaping (T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(nil, error)
                return
            }

            guard let data else {
                completion(nil, NetworkError.noData)
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    private func startMonitoring() {
        guard let reachability = reachability else { return }
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: .reachabilityChanged, object: reachability)
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start reachability notifier")
        }
    }
    
    @objc
    private func networkStatusChanged(_ notification: Notification) {
        if reachability?.connection != .unavailable {
            debugPrint("Network is reachable")
        } else {
            debugPrint("Network is not reachable")
        }
    }
    
}
