//
//  ApiService.swift
//  LockQuote
//
//  Created by Anastasia on 17/11/23.
//

import Foundation

struct BadURLError: Error {}

enum ApiService {
    static func getSearchResults(query: String) async throws -> SearchResponseDTO {
        guard
            let url = URL(string: "\(Environment.baseUrl)/search"),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            throw BadURLError()
        }
        
        components.queryItems = [URLQueryItem(name: "q", value: query)]

        guard let finalUrl = components.url else {
            throw BadURLError()
        }
        
        var request = URLRequest(url: finalUrl)
        request.setValue("Bearer \(Environment.apiToken)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let fetchedData = try JSONDecoder().decode(SearchResponseDTO.self, from: data)
        
        
        return fetchedData
    }
}
