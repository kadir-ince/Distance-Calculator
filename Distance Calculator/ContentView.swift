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
                print(self.locations)
                print(newLocation)
                print(self.locations)

            }) {
                Image(systemName: "plus")
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
                Button(action: {
                    //
                }) {
                    Image(systemName: "gear")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
