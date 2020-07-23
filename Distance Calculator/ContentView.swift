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

    @ObservedObject var settings = SettingManager()

    @State private var showSettings = false
    @State private var show = false

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
                ZStack {
                    Circle()
                        .trim(from: show ? CGFloat(dm.distance!) / CGFloat(settings.travelRadius) : 0.9, to: 1)
                        .stroke(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.37)
                        .rotationEffect(.degrees(90))
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .animation(Animation.easeIn(duration: 1))
                        .onAppear {
                            self.show.toggle()
                        }

                    if dm.distance != 0 {
                        Text("\(Int(dm.distance ?? 0)) km ")
                            .font(.title)
                    }
                }
            }
            HStack {
                Spacer()

                Button(action: {
                    self.showSettings.toggle()
                    print("nedir   ", CGFloat(self.dm.distance!))
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
