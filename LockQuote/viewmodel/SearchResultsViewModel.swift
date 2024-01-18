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
    static var skeleton: Song = Song(
        name: "Song name",
        artist: "Artist name"
    )
}

final class SearchResultsViewModel: ObservableObject {
    private let repository: SearchResultsRepository
    
    init(
        query: String,
        repository: SearchResultsRepository = SearchResultsLiveRepository()
    ) {
        self.query = query
        self.repository = repository
    }

    private var cancellables: Set<AnyCancellable> = []
    
    @Published var songResults: [Song] = []
    @Published var query: String
    @Published var isLoading = true
    
    @MainActor
    func searchSongs(query: String) async throws {
        isLoading = true
        Task { @MainActor in
            do {
                songResults = try await repository.getSearchResults(query: query).hits
                isLoading = false
            } catch {
                print(error)
            }
        }
    }
}
