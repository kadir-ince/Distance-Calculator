//
//  SettingsView.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var travelRadius: Double = 300
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .top, endPoint: .bottom))
                    .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.14)
                Image(systemName: "map").foregroundColor(.white).font(.largeTitle)
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.05)

            Text("How much gas do you have?").font(.title).multilineTextAlignment(.center)
            Slider(value: $travelRadius, in: 100 ... 500, step: 100)
                .padding()
            HStack {
                ForEach(0 ..< Int(travelRadius / 100), id: \.self) { _ in
                    Image(systemName: "car").font(.largeTitle).padding(.top, 20).foregroundColor(.blue)
                }
            }
            Text("My radius is \(Int(travelRadius)) km").font(.body).foregroundColor(.gray).bold().padding(.top, 20)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
