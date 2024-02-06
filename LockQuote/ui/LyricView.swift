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
            VStack {
                Text(
                    LocalizedStringKey(viewModel.currentPasteboard ?? "selectTextHint")
                )
                
                NavigationLink(
                    "useButton \(viewModel.countWords())",
                    destination: {
                        GeneratedPasswordView(
                            viewModel: .init(selectedLyric: viewModel.currentPasteboard!)
                        )
                    }
                )
                .buttonStyle(.bordered)
                .disabled(viewModel.selectionError)
            }
            .padding()
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
