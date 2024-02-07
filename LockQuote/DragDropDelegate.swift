//
//  DragDropDelegate.swift
//  LockQuote
//
//  Created by Anastasia on 7/2/24.
//

import SwiftUI

struct DragDropDelegate: DropDelegate {
    @Binding var draggedItem: String?
    
    let item: String
    var items: [String]
    var moveAction: (IndexSet, Int) -> Void

    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }

    func dropEntered(info: DropInfo) {
        guard item != draggedItem,
              let draggedItem = draggedItem,
              let from = items.firstIndex(of: draggedItem),
              let to = items.firstIndex(of: item) else { return }
        
        if items[to] != draggedItem {
            moveAction(IndexSet(integer: from), to > from ? to + 1 : to)
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
       return DropProposal(operation: .move)
    }
    
    func dropExited(info: DropInfo) {
        draggedItem = nil
    }
}
