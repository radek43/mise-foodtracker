//
//  KeychainService.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 13.03.2023.
//

import Foundation

struct KeychainService {
    enum KeychainError: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
     
    func save(
        service: String,
        account: String,
        password: Data
    ) throws {
        print("Keychain Service: Starting save..")
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateEntry
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        print("Keychain Service: Token saved successfully")
    }
    
    func get(
        service: String,
        account: String
    ) throws -> Data? {
        print("Keychain Service: Fetching \(account) keychain data..")
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        print("Status: \(status)")
        
        return result as? Data
    }
    
    func remove(service: String,
                account: String
    ) throws {
        print("Keychain Service: Deleting \(account) keychain data..")
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
             throw KeychainError.unknown(status)
        }
        
    }
}
