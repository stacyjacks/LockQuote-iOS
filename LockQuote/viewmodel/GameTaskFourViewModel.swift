//
//  GameTaskFourViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import Foundation

final class GameTaskFourViewModel: ObservableObject {
    init(password: String) {
        self.password = password
        passwords = shuffledPwdsArray()
    }
    
    @Published var password: String
    @Published var passwords: [String] = []
    @Published var correct: Bool = false
    @Published var selected: String = ""
    
    private func shuffledPwdsArray() -> [String] {
        let shuffledPwd1 = password.shuffled()
        let shuffledPwd2 = password.shuffled()
        let shuffledPwd3 = password.shuffled()
        return Array(
            Set(
                [String(shuffledPwd1), password, String(shuffledPwd3), String(shuffledPwd2)].shuffled()
            )
        )
    }
    
    func selectedOption(userSelection: String) {
        selected = userSelection
        correct = selected.contains(password)
    }
}
