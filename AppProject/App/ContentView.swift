//
//  ContentView.swift
//  AppProject
//
//  Created by NanbanTaro on 2025/07/27.
//  
//

import SwiftUI
import FrameworkProject

struct ContentView: View {
    let provider = FrameworkMessageProvider()

    @State private var sampleNumber = 0

    var body: some View {
        VStack(spacing: 12) {
            Text(provider.getMessage())

            Text(String(sampleNumber))

            Button("数値更新") {
                sampleNumber = provider.getRandomNumber()
            }
        }
    }
}

#Preview {
    ContentView()
}
