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
        VStack {
            HStack {
                Text(
                    viewModel.currentPasteboard
                    ?? "Select an excerpt from the lyric from 4 to 15 words, and hit Copy"
                )
                .padding()
                
                NavigationLink(
                    "USE SELECTION (\(viewModel.countWords()))",
                    destination: {
                        GeneratedPasswordView(
                            viewModel: .init(selectedLyric: viewModel.currentPasteboard!)
                        )
                    }
                )
                .buttonStyle(.bordered)
                .padding()
                .disabled(viewModel.selectionError)
            }
            .foregroundColor(Color.white)
            
            WebView(url: URL(string: viewModel.buildUrl())!)
                .ignoresSafeArea()
                .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.primaryPink)
    }
}

#Preview {
    LyricView(viewModel: .init(path: "/Joy-division-new-dawn-fades-lyrics"))
}
