//
//  GameResultView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI
import Lottie

struct GameResultView: View {
    @StateObject var viewModel: GameResultViewModel
    
    var body: some View {
        GameTaskView(
            taskNo: "", 
            title: "wellDone",
            taskHint: "",
            view: resultView
        )
    }
    
    var resultView: some View {
        VStack {
            
        }
    }
}

#Preview {
    GameResultView(viewModel: .init(password: ""))
}
