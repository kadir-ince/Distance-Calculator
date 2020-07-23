//
//  SettingsManager.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import Foundation
import Combine

class SettingManager: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @SettingDefault("travelRadius", defaultValue: 300)
    var travelRadius:Double {
        willSet{
            objectWillChange.send()
        }
    }
}
