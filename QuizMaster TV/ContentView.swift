//
//  ContentView.swift
//  QuizMaster TV
//
//  Created by STUDENT on 2025-11-24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        NavigationStack {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    ContentView()
}
