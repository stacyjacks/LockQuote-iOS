//
//  GameTaskFourView.swift
//  LockQuote
//
//  Created by Anastasia on 26/2/24.
//

import SwiftUI
import Lottie

struct GameTaskFourView: View {
    @StateObject var viewModel: GameTaskFourViewModel
    
    var body: some View {
        GameTaskView(
            taskNo: "4",
            taskHint: "taskFourSelectPwd",
            view: taskFourView
        )
    }
    
    var taskFourView: some View {
        VStack {
            ForEach(viewModel.passwords, id: \.self) { pwd in
                Button(action: {
                    viewModel.selectedOption(userSelection: pwd)
                }, label: {
                    Text(pwd)
                        .frame(maxWidth: .infinity)
                        .padding(.XS)
                        .foregroundColor(.white)
                        .background(toggleColor(pwd: pwd))
                        .cornerRadius(.XS)
                        .bold()
                })
            }
            
            if viewModel.selected == viewModel.password {
                LottieView(animation: .named("checkmarklightgreen"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 250, height: 250)
                HStack {
                    Text("great")
                        .bold()
                    NavigationLink("continueButton", destination: {
                        GameTaskFiveView(
                            viewModel: .init(password: viewModel.password)
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
            }
        }
    }
    
    private func toggleColor(pwd: String) -> Color {
        if viewModel.selected == pwd {
            if viewModel.correct {
                return .lightGreen
            } else {
                return .red
            }
        } else {
            return .mediumGrey
        }
    }
}

#Preview {
    GameTaskFourView(viewModel: .init(password: "0T7u"))
}
