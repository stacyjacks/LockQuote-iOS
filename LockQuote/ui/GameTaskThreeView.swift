//
//  GameTaskThreeView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI

struct GameTaskThreeView: View {
    @StateObject var viewModel: GameTaskThreeViewModel
    
    var body: some View {
        GameTaskView(
            taskNo: "3",
            taskHint: "taskThreeArrangePwd",
            view: taskThreeView
        )
    }
    
    var taskThreeView: some View {
        VStack {
            Text(viewModel.password) // to do add task with drag and drop password chars
            
            /* if viewModel.pwdArray == whatever */
            TaskDoneView(
                navigationView: GameTaskFourView(
                    viewModel: .init(
                        password: viewModel.password
                    )
                ),
                onAppear: { /* does not apply */ }
            )
        }
    }
}

#Preview {
    GameTaskThreeView(viewModel: .init(password: "O77u"))
}
