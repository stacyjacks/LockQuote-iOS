//
//  SearchResultsView.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

struct SearchResultsView: View {
    @StateObject var viewModel: SearchResultsViewModel
    
    private var songsAndSkeleton: [Song] {
        viewModel.songResults.isEmpty && viewModel.isLoading ?
        Array(repeating: .skeleton, count: 5) :
        viewModel.songResults
    }
        
    var body: some View {
        VStack(spacing: .S) {
            SearchBox(query: $viewModel.query, onPressedIntro: search)
                .padding(.horizontal, .S)
            
            List {
                ForEach(songsAndSkeleton, id: \.self) { song in
                    Button(action: {
                        viewModel.itemTapped(song)
                    }, label: {
                        SongItemView(song: song)
                    })
                    .buttonStyle(.plain)
                }
            }
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .background(Color.lightGrey)
        }
        .sheet(item: $viewModel.selectedItem) { song in
            VStack {
                HStack {
                    Text(
                        viewModel.currentPasteboard
                        ?? "Select an excerpt from the lyric, up to 15 words, and hit Copy"
                    )
                    .padding()
                    
                    Button(
                        "USE SELECTION (\(viewModel.countWords()))"
                    ) {
                        viewModel.checkSelection()
                        
                        if viewModel.selectionError {
                            // to do show error selection too small / too large
                        } else {
                            // to do navigate with selection to generated password view
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding()
                }
                .foregroundColor(Color.white)
                
                LyricWebView(url: URL(string: viewModel.buildUrl())!)
                    .ignoresSafeArea()
                    .navigationTitle(song.name)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color.primaryPink)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.primaryPink)
        .task {
            try? await viewModel.searchSongs(query: viewModel.query)
        }
    }
    
    private func search(query: String) {
        Task {
            try await viewModel.searchSongs(query: query)
        }
    }
}

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(viewModel: .init(query: ""))
    }
}
