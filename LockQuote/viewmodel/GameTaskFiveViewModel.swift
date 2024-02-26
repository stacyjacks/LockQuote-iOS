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
    }
    
    @Published var password: String
}
