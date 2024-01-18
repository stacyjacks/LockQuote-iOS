//
//  SearchResultsLiveRepository.swift
//  LockQuote
//
//  Created by Anastasia on 22/11/23.
//

import Foundation

final class SearchResultsLiveRepository: SearchResultsRepository {
    func getSearchResults(query: String) async throws -> SearchResponse {
        let dto = try await ApiService.getSearchResults(query: query)
        return SearchResponse(dto: dto)
    }
}
