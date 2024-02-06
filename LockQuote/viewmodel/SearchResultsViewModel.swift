//
//  SearchResultsViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 2/11/23.
//

import Foundation
import Combine
import UIKit.UIPasteboard

struct Song: Equatable, Hashable, Identifiable {
    var id: String
    var name: String
    var artist: String
    var apiPath: String
    var thumbnail: String
}

extension Song {
    static var skeleton: Song = Song(
        id: UUID().uuidString, 
        name: "Song name",
        artist: "Artist name",
        apiPath: "/song_name_whatever",
        thumbnail: "image.jpg"
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
    
    @Published var songResults: [Song] = []
    @Published var query: String
    @Published var isLoading = true
    @Published var selectionError = false
    
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
