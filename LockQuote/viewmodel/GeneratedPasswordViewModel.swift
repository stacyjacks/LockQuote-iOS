//
//  GeneratedPasswordViewModel.swift
//  LockQuote
//
//  Created by Anastasia on 24/1/24.
//

import Foundation

final class GeneratedPasswordViewModel: ObservableObject {
    let selectedLyric: String
    
    init(selectedLyric: String) {
        self.selectedLyric = selectedLyric
        showLoadingForTwoSecs()
    }
    
    @Published var showPwd: Bool = false
    @Published var hideLoading: Bool = false
    
    func onPwdTapped() {
        if showPwd {
            showPwd = false
        } else {
            showPwd = true
        }
    }
    
    private func showLoadingForTwoSecs() {
        if !hideLoading {
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                self.hideLoading = true
            }
        }
    }
    
    func cleanSelection() -> String {
        let selection = selectedLyric
        let cleanString = selection
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "\"", with: "")
            .replacingOccurrences(of: "!", with: "")
            .replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: ".", with: "")
        
        return cleanString
    }
    
    private func firstCharOfEveryWord() -> String {
        var string = ""
        let array = cleanSelection().split(separator: " ")
        
        array.forEach {
            $0.first?.write(to: &string)
        }
            
        return string
    }
    
    func generatedPassword() -> String {
        let aLetter = ["A", "a", "4"]
        let sLetter = ["S", "s", "5"]
        let eLetter = ["E", "e", "3"]
        let tLetter = ["T", "t", "7"]
        let iLetter = ["I", "i", "1"]
        let oLetter = ["O", "o", "0"]
        let gLetter = ["G", "g", "6"]
        
        let pwd = firstCharOfEveryWord()
        let modPwd = pwd
            .replacingOccurrences(of: "A", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "a", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "Á", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "á", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "À", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "à", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "Ä", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "ä", with: aLetter.randomElement()!)
            .replacingOccurrences(of: "S", with: sLetter.randomElement()!)
            .replacingOccurrences(of: "s", with: sLetter.randomElement()!)
            .replacingOccurrences(of: "E", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "e", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "É", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "é", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "È", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "è", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "Ë", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "ë", with: eLetter.randomElement()!)
            .replacingOccurrences(of: "T", with: tLetter.randomElement()!)
            .replacingOccurrences(of: "t", with: tLetter.randomElement()!)
            .replacingOccurrences(of: "I", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "i", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "Í", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "í", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "Ì", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "ì", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "Ï", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "ï", with: iLetter.randomElement()!)
            .replacingOccurrences(of: "O", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "o", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "Ó", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "ó", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "Ò", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "ò", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "Ö", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "ö", with: oLetter.randomElement()!)
            .replacingOccurrences(of: "G", with: gLetter.randomElement()!)
            .replacingOccurrences(of: "g", with: gLetter.randomElement()!)
        
        return modPwd
    }
}
