//
//  GameTaskTwoView.swift
//  LockQuote
//
//  Created by Anastasia on 6/2/24.
//

import SwiftUI

struct GameTaskTwoView: View {
    var body: some View {
        GameTaskView(
            taskNo: "2",
            taskHint: "taskTwoArrangeLyrics",
            view: taskTwoView
        )
    }
    
    var taskTwoView: some View {
        VStack {
            Text("Task 2 will be here") // to do drag and drop boxes
        }
    }
}

#Preview {
    GameTaskTwoView()
}
