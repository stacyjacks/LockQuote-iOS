//
//  StartViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 15/1/24.
//

import Foundation

final class StartViewModel: ObservableObject {
    enum Destination {
        case search(String)
    }
    
    @Published var destination: Destination? = nil
    @Published var query: String = ""
}
