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
    var body: some View {
        let provider = FrameworkMessageProvider()
        Text(provider.getMessage())
            .padding()
    }
}

#Preview {
    ContentView()
}
