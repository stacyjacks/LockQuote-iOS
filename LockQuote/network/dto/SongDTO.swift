//
//  SongDTO.swift
//  LockQuote
//
//  Created by Anastasia on 17/11/23.
//

import Foundation

struct SongDTO: Codable {
    var id: Int
    var api_path: String
    var path: String
    var title: String
    var header_image_thumbnail_url: String
    var primary_artist: PrimaryArtistDTO
}
