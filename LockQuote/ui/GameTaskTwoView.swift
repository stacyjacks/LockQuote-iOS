//
//  GameTaskTwoView.swift
//  LockQuote
//
//  Created by Anastasia on 6/2/24.
//

import SwiftUI
import Lottie
import WrappingHStack

struct GameTaskTwoView: View {
    @StateObject var viewModel: GameTaskTwoViewModel
    @State private var draggedItem: String?
    
    var body: some View {
        GameTaskView(
            taskNo: "2",
            taskHint: "taskTwoArrangeLyrics",
            view: taskTwoView
        )
    }
    
    var taskTwoView: some View {
        VStack {
            WrappingHStack {
                ForEach(viewModel.shuffledArray, id: \.self) { value in
                    Text(value)
                        .padding(.XS)
                        .background(toggleColor())
                        .cornerRadius(.XS)
                        .onDrag {
                            draggedItem = value
                            return NSItemProvider(object: value as NSString)
                        }
                        .onDrop(
                            of: [.utf8PlainText],
                            delegate: DragDropDelegate(
                                draggedItem: $draggedItem,
                                item: value,
                                items: viewModel.shuffledArray,
                                moveAction: { from, to in
                                    withAnimation(.bouncy) {
                                        viewModel.shuffledArray.move(
                                            fromOffsets: from,
                                            toOffset: to
                                        )
                                    }
                                }
                            )
                        )
                }
            }

            if viewModel.shuffledArray == viewModel.lyricArray {
                TaskDoneView(
                    navigationView: GameTaskThreeView(
                        viewModel: .init(
                            password: viewModel.password
                        )
                    ),
                    onAppear: { /* does not apply */ }
                )
            }
        }
    }
    
    private func toggleColor() -> Color {
        if viewModel.shuffledArray == viewModel.lyricArray {
            return Color.lightGreen
        } else {
            return Color.mediumGrey
        }
    }
}

#Preview {
    GameTaskTwoView(viewModel: .init(
        password: "", 
        lyric: "Oh I've walked on water run through fire can't seem to feel it anymore")
    )
}

