//
//  GameTaskTwoViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 7/2/24.
//

import Foundation

final class GameTaskTwoViewModel: ObservableObject {
    init(password: String, lyric: String) {
        self.password = password
        self.lyric = lyric
        lyricArray = lyric.components(separatedBy: " ")
        shuffledArray = lyricArray.shuffled()
    }
    
    @Published var password: String
    @Published var lyric: String
    @Published var lyricArray: [String]
    @Published var shuffledArray: [String] = []
}
