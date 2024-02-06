//
//  Mapper.swift
//  LockQuote
//
//  Created by Anastasia on 22/11/23.
//

import Foundation

struct SearchResponse {
    var hits: [Song]
}

extension SearchResponse {
    init(dto: SearchResponseDTO) {
        self.init(
            hits: dto.response.hits.map(\.result).map(Song.init)
        )
    }
}

extension Song {
    init(dto: SongDTO) {
        self.init(
            id: String(dto.id), 
            name: dto.title,
            artist: dto.primary_artist.name,
            apiPath: dto.api_path,
            thumbnail: dto.header_image_thumbnail_url
        )
    }
}
