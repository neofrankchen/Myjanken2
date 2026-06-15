//
//  MyjankenApp.swift
//  Myjanken
//
//  Created by Neo Frank on 2026/4/16.
//

import SwiftUI

private struct RootView: View {
    @State private var isGameStarted = false

    var body: some View {
        TopView(isGameStarted: $isGameStarted)
    }
}

@main
struct MyjankenApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
