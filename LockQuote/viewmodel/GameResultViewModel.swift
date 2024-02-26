//
//  GameResultViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import Foundation

final class GameResultViewModel: ObservableObject {
    init(password: String) {
        self.password = password
    }
    
    @Published var password: String
}
