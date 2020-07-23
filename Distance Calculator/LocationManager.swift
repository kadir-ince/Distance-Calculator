//
//  LocationManager.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//
import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocation()
    
    @Published var location: CLLocation? = nil
    override init() {
        super.init()
        self.locationManager.delegate = self
//        self.locationManager.desiredAccu
        
    }
}
