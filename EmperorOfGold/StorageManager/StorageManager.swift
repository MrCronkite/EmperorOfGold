//
//  StorageManager.swift
//  EmperorOfGold
//
//  Created by admin1 on 27.04.23.
//

import Foundation

protocol StorageManagerProtocol {
    func set(_ object: String, forKey key: StorageManager.Keys)
    
    func string(forKey key: StorageManager.Keys) -> String?
}

final class StorageManager {
    public enum Keys: String {
        case background
        case curentLvl
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: String, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> String? {
        userDefaults.object(forKey: key) as? String
    }
}

extension StorageManager: StorageManagerProtocol {
    func string(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue)
    }
    
    func set(_ object: String, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    
}
