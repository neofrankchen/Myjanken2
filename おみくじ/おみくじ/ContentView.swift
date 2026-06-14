//
//  ContentView.swift
//  おみくじ
//
//  Created by Neo Frank on 2026/4/20.
//

import SwiftUI

struct ContentView: View {
    @State private var resultText = "おみくじを引く"
    private let fortunes = ["大吉", "中吉", "小吉", "吉"]

    var body: some View {
        VStack {
            Text("おみくじの結果")
                .font(.title2)
                .fontWeight(.bold)

            Spacer()

            Text(resultText)
                .font(.largeTitle)
                .fontWeight(.semibold)

            Spacer()

            Button("おみくじを引く") {
                resultText = fortunes.randomElement() ?? "吉"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
