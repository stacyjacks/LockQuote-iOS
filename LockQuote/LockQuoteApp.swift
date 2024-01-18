//
//  LockQuoteApp.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

@main
struct LockQuoteApp: App {
    var body: some Scene {
        WindowGroup {
            StartView(viewModel: .init())
        }
    }
}
