//
//  SettingsView.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
   @ObservedObject var settings = SettingManager()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .top, endPoint: .bottom))
                    .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.14)
                Image(systemName: "map").foregroundColor(.white).font(.largeTitle)
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.05)

            Text("How much gas do you have?").font(.title).multilineTextAlignment(.center)
            Slider(value: $settings.travelRadius, in: 100 ... 500, step: 100)
                .padding()
            HStack {
                ForEach(0 ..< Int(settings.travelRadius / 100), id: \.self) { _ in
                    Image(systemName: "car").font(.largeTitle).padding(.top, 20).foregroundColor(.blue)
                }
            }
            Text("My radius is \(Int(settings.travelRadius)) km").font(.body).foregroundColor(.gray).bold().padding(.top, 20)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done").bold().font(.title).shadow(radius: 10)
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
