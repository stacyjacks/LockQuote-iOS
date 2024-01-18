//
//  Environment.swift
//  LockQuote
//
//  Created by Anastasia on 17/11/23.
//

import Foundation

enum Environment {
    static var baseUrl: URL {
        URL(string: "https://api.genius.com")!
    }
    
    static var apiToken: String {
        ""
    }
}
