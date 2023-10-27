//
//  SearchResultsView.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

struct SearchResultsView: View {
    @StateObject var viewModel: SearchResultsViewModel
    
    init(query: String) {
        self._viewModel = .init(wrappedValue: SearchResultsViewModel(query: query))
    }
    
    var body: some View {
        VStack(spacing: .S) {
            SearchBox(query: $viewModel.query)
                .padding(.horizontal, .S)
            
            if viewModel.isLoading {
                VStack(alignment: .leading) {
                    ForEach(Array(0...5), id: \.self) { song in
                        SongItemView(song: .skeleton)
                    }
                    .redacted(reason: .placeholder)
                }
                .padding(10)
                .background(Color.lightGrey)
            } else {
                VStack(alignment: .leading) {
                    ForEach(viewModel.songResults, id: \.self) { song in
                        SongItemView(song: song).onTapGesture {
                            
                        }
                    }
                }
                .padding(10)
                .background(Color.lightGrey)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.primaryPink)
    }
}

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(query: "")
    }
}
