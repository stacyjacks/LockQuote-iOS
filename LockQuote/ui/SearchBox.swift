//
//  SearchBox.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

struct SearchBox: View {
    @Binding var query: String
    var onPressedIntro: ((String) -> Void)
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("queryHint", text: $query)
        }
        .padding(16)
        .background(
            Color.white.cornerRadius(18)
        )
        .onSubmit {
            guard query.isEmpty == false else { return }
            onPressedIntro(query)
        }
    }
}

struct SearchBox_Previews: PreviewProvider {
    static var previews: some View {
        SearchBox(query: .constant("Hey"), onPressedIntro: {_ in})
    }
}
