//
//  GameTaskOneView.swift
//  LockQuote
//
//  Created by Anastasia on 30/1/24.
//

import SwiftUI
import Lottie
import WrappingHStack

struct GameTaskOneView: View {
    @StateObject var viewModel: GameTaskOneViewModel
    @FocusState private var focusedField: Int?
    
    var body: some View {
        GameTaskView(
            taskNo: "1",
            taskHint: "taskOneEnterPwd",
            view: taskOneView
        )
    }
    
    var taskOneView: some View {
        VStack {
            WrappingHStack {
                ForEach(viewModel.pwdArray.indices, id: \.self) { index in
                    TextField(
                        viewModel.pwdArray[index],
                        text: $viewModel.input[index]
                    )
                    .focused($focusedField, equals: index)
                    .padding(6)
                    .fixedSize()
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .background(toggleColor(
                        text: viewModel.input[index],
                        index: index
                    ))
                    .cornerRadius(.XS)
                    .onChange(of: viewModel.input[index]) { value in
                        if value == viewModel.pwdArray[index] {
                            focusedField! += 1
                        } else {
                            focusedField! = focusedField!
                        }
                    }
                    .onChange(of: viewModel.input) { _ in
                        viewModel.check(index: index)
                        viewModel.checkAllCorrect()
                    }
                }
            }
            
            if viewModel.done {
                LottieView(animation: .named("checkmarklightgreen"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 250, height: 250)
                HStack {
                    Text("great")
                        .bold()
                        .onAppear {
                            focusedField = nil
                        }
                    NavigationLink("continueButton", destination: {
                        GameTaskTwoView(
                            viewModel: .init(
                                password: viewModel.password,
                                lyric: viewModel.lyric
                            )
                        )
                    })
                    .frame(alignment: .bottom)
                    .padding(.XS)
                    .background(Color.lightGreen)
                    .foregroundColor(.white)
                    .cornerRadius(.XS)
                    .bold()
                    .disabled(false)
                }
            } else {
                Button(action: {
                    viewModel.clearInput()
                    focusedField = nil
                }, label: {
                    Text("clearButton")
                        .padding(.XS)
                        .foregroundColor(.white)
                        .background(Color.primaryPink)
                        .cornerRadius(.XS)
                        .bold()
                        
                })
                .padding(.M)
            }
        }
    }
    
    private func toggleColor(text: String, index: Int) -> Color {
        let correct = viewModel.correct
        
        if text.isEmpty {
            return .lightGrey
        } else if correct[index]! {
            return .lightGreen
        } else {
            return .red
        }
    }
}

#Preview {
    GameTaskOneView(viewModel: .init(password: "YcBy4", lyric: ""))
}
