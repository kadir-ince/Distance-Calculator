//
//  SettingDefaults.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import Foundation

@propertyWrapper
struct SettingDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue : T {
        get{
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set{
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
