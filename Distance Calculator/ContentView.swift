//
//  ContentView.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.top)
                    .foregroundColor(.gray)
                Circle()
                    .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.03)
                    .foregroundColor(.blue).opacity(0.4)
            }
            VStack {
                Button(action: {
                    //
                }) {
                    Image(systemName: "plus")
                }
                .font(.title)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding(.top, -35)

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
