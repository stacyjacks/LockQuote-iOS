//
//  TaskDoneView.swift
//  LockQuote
//
//  Created by Anastasia on 27/2/24.
//

import SwiftUI
import Lottie

struct TaskDoneView<Content: View>: View {
    let navigationView: Content
    let onAppear: () -> Void
    
    var body: some View {
        LottieView(animation: .named("checkmarklightgreen"))
            .playing(loopMode: .loop)
            .resizable()
            .frame(width: 250, height: 250)
        HStack {
            Text("great")
                .bold()
                .onAppear(perform: onAppear)
            
            NavigationLink("continueButton", destination: {
                navigationView
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

#Preview {
    TaskDoneView(navigationView: EmptyView(), onAppear: {})
}
