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
                    NavigationLink {
                        LyricView(viewModel: .init(path: song.apiPath))
                    } label: {
                        SongItemView(song: song)
                    }
                }
            }
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .background(Color.lightGrey)
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
        NavigationView {
            SearchResultsView(viewModel: .init(query: ""))
        }
    }
}
