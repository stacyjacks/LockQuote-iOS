//
//  GameTaskFiveViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import Foundation

final class GameTaskFiveViewModel: ObservableObject {
    init(password: String) {
        self.password = password
        pwdArray = password.map { String($0) }
        input = Array(repeating: "", count: password.count)
    }
    
    @Published var password: String
    @Published var pwdArray: [String]
    @Published var input: [String]
    @Published var correct: [Int : Bool] = [0: true]
    @Published var done: Bool = false
    
    func check(index: Int) {
        correct[index] = pwdArray[index] == input[index]
        
        if input[index].count > 1 {
            input[index].removeLast()
        }
    }
    
    func checkAllCorrect() {
        done = !correct.values.contains(false)
    }
    
    func clearInput() {
        input = Array(repeating: "", count: password.count)
    }
}
