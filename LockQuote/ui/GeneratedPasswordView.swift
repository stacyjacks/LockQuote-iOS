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
            VStack(spacing: .S) {
                Text("yourPassword")
                    .foregroundColor(.white)
                
                VStack(spacing: 0) {
                    Text("takeAGoodLook")
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical)
                    
                    Text(selectedLyricFirstBold)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .background(Color.lightGrey)
                        .cornerRadius(15, corners: [.topLeft, .bottomRight, .bottomLeft])
                        .padding()
                        .italic()
                    
                    Text(pwdToggle(
                        text: viewModel.generatedPassword(),
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
                            Text(String(viewModel.generatedPassword().count))
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
                                    password: viewModel.generatedPassword(),
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
                    
                    Button(action: {
                        // to do navigation
                    }, label: {
                        Text(("tryAgainButton"))
                            .padding(.XS)
                            .foregroundColor(.white)
                            .background(Color.primaryPink)
                            .cornerRadius(8)
                            .bold()
                            
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.S)
                .background(Color.white)
                .cornerRadius(25)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .background(Color.primaryPink)
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
