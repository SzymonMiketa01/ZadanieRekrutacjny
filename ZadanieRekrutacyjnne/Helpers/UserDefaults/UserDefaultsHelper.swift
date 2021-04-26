//
//  UserDefaultsHelper.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation

struct UserDefaultsHelper {
    
    static func save(object: Any, for key: UserDefaultsKey) {
        UserDefaults.standard.set(object, forKey: key.rawValue)
    }
    
    static func getString(for key: UserDefaultsKey) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
}
