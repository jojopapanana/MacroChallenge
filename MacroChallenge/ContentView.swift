//
//  ContentView.swift
//  MacroChallenge
//
//  Created by Jovanna Melissa on 01/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private let context = SwiftDataContextManager.shared.context
    
    var body: some View {
        if let context{
            UploadClothView()
                .environment(\.modelContext, context)
        } else {
            Text("failed")
        }
    }
}

#Preview {
    ContentView()
}
