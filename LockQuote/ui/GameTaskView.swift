//
//  GameTaskView.swift
//  LockQuote
//
//  Created by Anastasia on 7/2/24.
//

import SwiftUI

struct GameTaskView<Content: View>: View {
    let taskNo: String
    let taskHint: LocalizedStringKey
    let view: Content
    
    var body: some View {
        VStack {
            Text("memorisationTask \(taskNo)")
                .foregroundColor(.white)
                .padding(.XS)
            
            VStack {
                Text(taskHint)
                    .padding(.XS)
                    .multilineTextAlignment(.leading)
                
                view.padding(.M)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(25)
        }
        .padding()
        .background(Color.primaryPink)
    }
}

#Preview {
    GameTaskView(
        taskNo: "1",
        taskHint: "taskOneEnterPwd",
        view: EmptyView()
    )
}
