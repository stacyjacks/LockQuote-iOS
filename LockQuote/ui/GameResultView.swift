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
            taskHint: "congratsNewPassword",
            view: resultView
        )
    }
    
    var resultView: some View {
        VStack {
            Text(
                pwdToggle(
                    text: viewModel.password,
                    showPwd: viewModel.showPwd
                )
            )
            .onTapGesture {
                viewModel.onPwdTapped()
            }
            .font(.system(size: 28, weight: .bold, design: .monospaced))
            
            LockQuoteButton(
                action: { viewModel.onCopyTapped() },
                string: "copyButton"
            )
            .padding(.M)
            
            LottieView(animation: .named("vinylrecordblack"))
                .playing(loopMode: .loop)
                .resizable()
                .frame(width: 250, height: 250)
            
            LockQuoteButton(
                action: {/* to do */},
                string: "anotherGoButton"
            )
            LockQuoteButton(
                action: {/* to do */},
                string: "makeNewPwdButton"
            )
        }
    }
    
    private func pwdToggle(text: String, showPwd: Bool) -> String {
        if showPwd {
            text
        } else {
            String(repeating: "*", count: text.count)
        }
    }
}

#Preview {
    GameResultView(viewModel: .init(password: "O7tu"))
}
