//
//  ContentView.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()

    @State private var showSettings = false

    @ObservedObject var dm = DistanceManager()

    var body: some View {
        VStack {
            ZStack {
                MapView(centerCoordinate: $centerCoordinate, mapAnnotations: locations)
                    .edgesIgnoringSafeArea(.top)
                    .foregroundColor(.gray)
                Circle()
                    .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.03)
                    .foregroundColor(.blue).opacity(0.4)
            }

            Button(action: {
                let newLocation = MKPointAnnotation()
                newLocation.coordinate = self.centerCoordinate
                self.locations.append(newLocation)

                if self.locations.count == 2 {
                    let locationA = CLLocation(latitude: self.locations.first!.coordinate.latitude, longitude: self.locations.first!.coordinate.longitude)

                    let locationB = CLLocation(latitude: self.locations.last!.coordinate.latitude, longitude: self.locations.last!.coordinate.longitude)

                    self.dm.distance([locationA, locationB])

                } else if self.locations.count > 2 {
                    self.dm.distance = 0
                    self.locations.removeAll()
                }

            }) {
                if self.locations.count != 2 {
                    Image(systemName: "plus")
                } else {
                    Image(systemName: "trash")
                }
            }
            .font(.title)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding(.top, -35)

            VStack {
                Text("Distance Calculator")
                    .font(.title).bold()
                Circle()
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.37)
            }
            HStack {
                Spacer()
                Spacer()
                if dm.distance != 0 {
                    Text("\(Int(dm.distance ?? 0)) km ")
                        .font(.title)
                }
                Spacer()

                Button(action: {
                    self.showSettings.toggle()
                }, label: {
                    Image(systemName: "gear")
                        .font(.largeTitle)
                        .padding()
                }).sheet(isPresented: $showSettings, content: { SettingsView() })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
