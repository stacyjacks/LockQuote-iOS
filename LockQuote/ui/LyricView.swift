//
//  LyricView.swift
//  LockQuote
//
//  Created by Anastasia on 25/1/24.
//

import SwiftUI

struct LyricView: View {
    @StateObject var viewModel: LyricViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(
                        viewModel.currentPasteboard
                        ?? "Select an excerpt from the lyric, up to 15 words, and hit Copy"
                    )
                    .padding()
                    
                    NavigationLink(
                        "USE SELECTION (\(viewModel.countWords()))",
                        destination: { GeneratedPasswordView(viewModel: .init()) }
                    )
                    .buttonStyle(.bordered)
                    .padding()

                }
                .foregroundColor(Color.white)
                
                WebView(url: URL(string: viewModel.buildUrl())!)
                    .ignoresSafeArea()
                    .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color.primaryPink)
        }
    }
}

#Preview {
    LyricView(viewModel: .init(path: ""))
}
