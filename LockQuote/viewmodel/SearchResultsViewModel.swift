//
//  SearchResultsViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 2/11/23.
//

import Foundation
import Combine

struct Song: Equatable, Hashable {
    var name: String
    var artist: String
}

extension Song {
    static var skeleton: Song = Song(name: "Song name", artist: "Artist name")
}

final class SearchResultsViewModel: ObservableObject {
    init(query: String) {
        self.query = query
        
        bind()
    }

    private var cancellables: Set<AnyCancellable> = []
    
    @Published var songResults: [Song] = []
    @Published var query: String
    @Published var isLoading = false

    func bind() {
        $query
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .sink { [unowned self] newQuery in
                Task {
                    try await searchSongs(query: newQuery)
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func searchSongs(query: String) async throws {
        isLoading = true
        try await Task.sleep(nanoseconds: 1000000000)
        songResults = [
            .init(name: "Beetlebum", artist: "Blur"),
            .init(name: "Let It Be", artist: "The Beatles"),
            .init(name: "Time Is Running Out", artist: "Muse")
        ]
        isLoading = false
    }
}
