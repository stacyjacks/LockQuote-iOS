//
//  LyricViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 25/1/24.
//

import Foundation
import Combine
import UIKit.UIPasteboard

final class LyricViewModel: ObservableObject {
    private let path: String
    private let center: NotificationCenter
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(
        path: String,
        center: NotificationCenter = .default
    ) {
        self.path = path
        self.center = center
        
        bind()
    }
    
    @Published var selectionError = false
    @Published var currentPasteboard: String?
    
    private func bind() {
        center.publisher(for: UIPasteboard.changedNotification).sink { [weak self] _ in
            self?.currentPasteboard = UIPasteboard.general.string
            self?.removeBrackets()
        }.store(in: &cancellables)
    }
    
    func buildUrl() -> String {
        return "https://genius.com" + path
    }
    
    func countWords() -> Int {
        return currentPasteboard?.split(separator: " ").count ?? 0
    }
    
    func checkSelection() {
        if countWords() > 15 || countWords() < 3 {
            selectionError = true
        }
    }
    
    private func removeBrackets() {
        if currentPasteboard != nil {
            guard let openingBracket = currentPasteboard!.firstIndex(of: "[") else { return }
            guard let closingBracket = currentPasteboard!.firstIndex(of: "]") else { return }
            
            let range = openingBracket...closingBracket
            currentPasteboard!.removeSubrange(range)
        }
    }
}
