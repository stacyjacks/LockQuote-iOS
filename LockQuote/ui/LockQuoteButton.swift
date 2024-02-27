//
//  LockQuoteButton.swift
//  LockQuote
//
//  Created by Anastasia on 27/2/24.
//

import SwiftUI

struct LockQuoteButton: View {
    let action: () -> Void
    let string: String
    
    var body: some View {
        Button(
            action: { action() },
            label: {
                Text(LocalizedStringKey(string))
                    .padding(.XS)
                    .foregroundColor(.white)
                    .background(Color.primaryPink)
                    .cornerRadius(.XS)
                    .bold()
            }
        )
    }
}

#Preview {
    LockQuoteButton(action: {}, string: "copyButton")
}
