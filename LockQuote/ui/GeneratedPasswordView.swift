//
//  GeneratedPasswordView.swift
//  LockQuote
//
//  Created by Anastasia on 23/1/24.
//

import SwiftUI

struct GeneratedPasswordView: View {
    @StateObject var viewModel: GeneratedPasswordViewModel
    
    var body: some View {
        VStack(spacing: .S) {
            Text("Your password")
                .foregroundColor(.white)
            
            VStack(spacing: 0) {
                Text("Take a good look at the selected lyric and the password we've generated for you:")
                    .padding(.vertical)
                
                Text(viewModel.selectedLyric)
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
                    
                    Image(systemName: "brain.filled.head.profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                .padding()
                .background(Color.lightGrey)
                .cornerRadius(15)
                
                Button(action: {
                    // to do navigation
                }, label: {
                    Text(("Help me to memorise it").uppercased())
                        .padding(.XS)
                        .foregroundColor(.white)
                        .background(Color.primaryPink)
                        .cornerRadius(8)
                        .bold()
                        
                })
                .padding(.XS)
                
                Button(action: {
                    // to do navigation
                }, label: {
                    Text(("Try again").uppercased())
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
    
    private func pwdToggle(text: String, showPwd: Bool) -> String {
        if showPwd {
            text
        } else {
            String(repeating: "*", count: text.count)
        }
    }
}

#Preview {
    GeneratedPasswordView(
        viewModel: .init(selectedLyric: "You could be young again, \n Be un-reborn Again")
    )
}
