//
//  GameTaskFiveView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI
import WrappingHStack

struct GameTaskFiveView: View {
    @StateObject var viewModel: GameTaskFiveViewModel
    @FocusState private var focusedField: Int?
    
    var body: some View {
        GameTaskView(
            taskNo: "5",
            taskHint: "taskFiveEnterPwd",
            view: taskFiveView
        )
    }
    
    var taskFiveView: some View {
        VStack {
            WrappingHStack {
                ForEach(viewModel.pwdArray.indices, id: \.self) { index in
                    TextField(
                        viewModel.input[index],
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
                    .sensoryFeedback(
                        .warning,
                        trigger: viewModel.input[index] != viewModel.pwdArray[index]
                    )
                }
            }
            
            if viewModel.done {
                TaskDoneView(
                    navigationView: GameResultView(
                        viewModel: .init(
                            password: viewModel.password
                        )
                    ),
                    onAppear: { /* does not apply */ }
                )
            } else {
                LockQuoteButton(
                    action: {
                        viewModel.clearInput()
                        focusedField = nil
                    },
                    string: "clearButton"
                )
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
    GameTaskFiveView(viewModel: .init(password: "O7tU"))
}
