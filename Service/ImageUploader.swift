//
//  ImageUploader.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 8/28/22.
//

import UIKit


struct ImageUploader {
    static var keychainService = KeychainService()
    
    static func uploadImage1(email: String, paramName: String, fileName: String, image: UIImage, urlPath: String) {
        let url = URL(string: "http://127.0.0.1:8000\(urlPath)")
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        var token = ""
        
        // Get token from KeyChain
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("keychain-imageUploader: \(error)")
        }
        
        // Set Content-Type Header to multipart/form-data and add the boundary
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        }).resume()
    }
}
