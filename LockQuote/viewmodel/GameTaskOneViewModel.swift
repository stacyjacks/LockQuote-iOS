//
//  GameTaskOneViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 31/1/24.
//

import Foundation

final class GameTaskOneViewModel: ObservableObject {
    init(password: String, lyric: String) {
        self.password = password
        self.lyric = lyric
        pwdArray = password.map { String($0) }
        input = Array(repeating: "", count: password.count)
    }
    
    @Published var password: String
    @Published var lyric: String
    @Published var pwdArray: [String]
    @Published var input: [String]
    @Published var correct: [Int : Bool] = [0: true]
    @Published var done: Bool = false
    
    func check(index: Int) {
        correct[index] = pwdArray[index] == input[index]
    }
    
    func checkAllCorrect() {
        if !correct.values.contains(false) {
            done = true
        } else {
            done = false
        }
    }
    
    func clearInput() {
        input = Array(repeating: "", count: password.count)
    }
}
