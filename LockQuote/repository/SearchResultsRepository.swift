//
//  SearchResultsRepository.swift
//  LockQuote
//
//  Created by Anastasia on 22/11/23.
//

import Foundation

protocol SearchResultsRepository {
    func getSearchResults(query: String) async throws -> SearchResponse
}
