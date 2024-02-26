//
//  GameTaskFiveView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI
import Lottie

struct GameTaskFiveView: View {
    @StateObject var viewModel: GameTaskFiveViewModel
    
    var body: some View {
        GameTaskView(
            taskNo: "5",
            taskHint: "taskFiveEnterPwd",
            view: taskFiveView
        )
    }
    
    var taskFiveView: some View {
        VStack {
            
        }
    }
}

#Preview {
    GameTaskFiveView(viewModel: .init(password: "O7tU"))
}
