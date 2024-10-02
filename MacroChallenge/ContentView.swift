//
//  ContentView.swift
//  MacroChallenge
//
//  Created by Jovanna Melissa on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hi Dunia Gembiralah!")
                .font(.custom("Montserrat-SemiBold", size: 16))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
