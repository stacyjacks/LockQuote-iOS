//
//  GameTaskFiveView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI

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
            // to do add task with textfields
            
            /* if viewModel.pwdArray == whatever */
            TaskDoneView(
                navigationView: GameResultView(
                    viewModel: .init(
                        password: viewModel.password
                    )
                ),
                onAppear: { /* does not apply */ }
            )
            /* else */
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

#Preview {
    GameTaskFiveView(viewModel: .init(password: "O7tU"))
}
