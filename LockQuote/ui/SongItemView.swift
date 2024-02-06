//
//  SongItemView.swift
//  LockQuote
//
//  Created by Anastasia on 2/11/23.
//

import SwiftUI

struct SongItemView: View {
    var song: Song
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: song.thumbnail), scale: 6)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.artist)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            Color.white.cornerRadius(18)
        )
    }
}

struct SongItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                SongItemView(song: .init(id: "", name: "Song name asdf asdfad asdfasd as", artist: "Artist name", apiPath: "", thumbnail: ""))
                SongItemView(song: .skeleton)
                SongItemView(song: .skeleton)
            }
        }
        .background(Color.lightGrey)
    }
}
