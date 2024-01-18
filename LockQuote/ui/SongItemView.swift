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
            Image(systemName: "music.note.list")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.artist)
            }
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
                SongItemView(song: .init(id: "", name: "Song name asdf asdfad asdfasd fasdf asdfas dfasdf as", artist: "Artist name", apiPath: ""))
                SongItemView(song: .skeleton)
                SongItemView(song: .skeleton)
            }
        }
        .background(Color.lightGrey)
    }
}
