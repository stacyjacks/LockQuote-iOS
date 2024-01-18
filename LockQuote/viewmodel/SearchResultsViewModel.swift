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
}

extension Song {
    static var skeleton: Song = Song(
        id: UUID().uuidString, 
        name: "Song name",
        artist: "Artist name",
        apiPath: "/song_name_whatever"
    )
}

final class SearchResultsViewModel: ObservableObject {
    private let repository: SearchResultsRepository
    private let center: NotificationCenter
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(
        query: String,
        repository: SearchResultsRepository = SearchResultsLiveRepository(),
        center: NotificationCenter = .default
    ) {
        self.query = query
        self.repository = repository
        self.center = center
        
        bind()
    }
    
    @Published var songResults: [Song] = []
    @Published var query: String
    @Published var isLoading = true
    @Published var selectionError = false
    @Published var selectedItem: Song?
    @Published var currentPasteboard: String?
    
    private func bind() {
        center.publisher(for: UIPasteboard.changedNotification).sink { [weak self] _ in
            self?.currentPasteboard = UIPasteboard.general.string
        }.store(in: &cancellables)
    }
    
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
    
    func buildUrl() -> String {
        return "https://genius.com" + selectedItem!.apiPath
/*    */}
    
    func itemTapped(_ song: Song) {
        selectedItem = song
    }
    
//    func cleanPasteboard() {
//        if currentPasteboard != nil {
//            let openingBracket = currentPasteboard!.startIndex
//            let closingBracket = currentPasteboard!.endIndex
//            
//            if currentPasteboard!.contains("[") || currentPasteboard!.contains("]") {
//                let range = openingBracket..<closingBracket
//                currentPasteboard!.removeSubrange(range)
//            }
//    }
    
    func countWords() -> Int {
        return currentPasteboard?.split(separator: " ").count ?? 0
    }
    
    func checkSelection() {
        if countWords() > 15 || countWords() < 3 {
            selectionError = true
        }
    }
}
