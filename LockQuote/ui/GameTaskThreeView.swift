//
//  GameTaskThreeView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI
import Lottie

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
            NavigationLink("continueButton", destination: {
                GameTaskFourView(
                    viewModel: .init(password: viewModel.password)
                )
            })
        }
    }
}

#Preview {
    GameTaskThreeView(viewModel: .init(password: "O77u"))
}
