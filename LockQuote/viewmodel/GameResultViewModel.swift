//
//  GameResultViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import Foundation
import UIKit.UIPasteboard

final class GameResultViewModel: ObservableObject {
    init(password: String) {
        self.password = password
    }
    
    @Published var password: String
    @Published var showPwd: Bool = false
    @Published var pasteboard = UIPasteboard.general
    @Published var showInfo: Bool = false
    
    func onCopyTapped() {
        pasteboard.string = password
    }
    
    func onPwdTapped() {
        if showPwd {
            showPwd = false
        } else {
            showPwd = true
        }
    }
    
    func onLightbulbTapped() {
        if showInfo {
            showInfo = false
        } else {
            showInfo = true
        }
    }
}
