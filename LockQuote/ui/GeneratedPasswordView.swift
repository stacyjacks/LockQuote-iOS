//
//  GeneratedPasswordView.swift
//  LockQuote
//
//  Created by Anastasia on 23/1/24.
//

import SwiftUI
import Lottie

struct GeneratedPasswordView: View {
    @StateObject var viewModel: GeneratedPasswordViewModel
    @SwiftUI.Environment(\.dismiss) private var dismiss
    
    var body: some View {
        if !viewModel.hideLoading {
            VStack {
                LottieView(animation: .named("loadinglock"))
                    .playing(loopMode: .playOnce)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.L)
                
                Text("justASec")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.L)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.primaryPink)
        } else {
            GameTaskView(
                taskNo: "",
                title: "yourPassword",
                taskHint: "takeAGoodLook",
                view: generatedPwdView
            )
        }
    }
    
    var generatedPwdView: some View {
        VStack(spacing: 0) {
            Text(selectedLyricFirstBold)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.lightGrey)
                .cornerRadius(15, corners: [.topLeft, .bottomRight, .bottomLeft])
                .padding()
                .italic()
            
            Text(pwdToggle(
                text: viewModel.password,
                showPwd: viewModel.showPwd
            ))
                .onTapGesture {
                    viewModel.onPwdTapped()
                }
                .padding(.M)
                .font(.system(size: 28, weight: .bold, design: .monospaced))
            
            Image(systemName: "triangleshape.fill")
                .resizable()
                .foregroundColor(.lightGrey)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
            
            HStack {
                VStack {
                    Text(String(viewModel.password.count))
                        .font(.system(size: 24, weight: .bold))
                    Text("characters")
                }
                .padding()
                
                Image(.cerebro)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.lightGrey)
            .cornerRadius(15)
            
            NavigationLink(
                "helpMeButton",
                destination: {
                    GameTaskOneView(
                        viewModel: .init(
                            password: viewModel.password,
                            lyric: viewModel.cleanSelection()
                        )
                    )
                }
            )
            .padding(.XS)
            .background(Color.primaryPink)
            .foregroundColor(.white)
            .cornerRadius(.XS)
            .bold()
            .disabled(false)
            .padding(.XS)
            
            LockQuoteButton(
                action: {
                    dismiss()
                },
                string: "tryAgainButton",
                width: 240
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
    
    var selectedLyricFirstBold: AttributedString {
        var string = AttributedString(viewModel.cleanSelection())

        viewModel.cleanSelection().split(separator: " ").forEach { word in
            guard let wordStartRange = string.range(of: word)?.lowerBound else { return }
            let wordEndRange = string.index(wordStartRange, offsetByCharacters: 1)
            
            string[wordStartRange..<wordEndRange].font = .boldSystemFont(ofSize: .S)
        }
        
        return string
    }
}

#Preview {
    GeneratedPasswordView(
        viewModel: .init(
            selectedLyric: "Oh I've walked on water run through fire can't seem to feel it anymore"
        )
    )
}
