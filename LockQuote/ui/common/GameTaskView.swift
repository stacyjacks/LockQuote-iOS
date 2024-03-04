//
//  GameTaskView.swift
//  LockQuote
//
//  Created by Anastasia on 7/2/24.
//

import SwiftUI

struct GameTaskView<Content: View>: View {
    let taskNo: String
    var title: String? = nil
    let taskHint: LocalizedStringKey
    let view: Content
    
    var body: some View {
        VStack {
            if title != nil {
                Text(LocalizedStringKey(title!))
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .font(.headline)
            } else {
                Text("memorisationTask \(taskNo)")
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .font(.headline)
            }
            
            ScrollView {
                VStack {
                    Text(taskHint)
                        .padding(.XS)
                        .multilineTextAlignment(.leading)
                    
                    view.padding(.M)
                }
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
