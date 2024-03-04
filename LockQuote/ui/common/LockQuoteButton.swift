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
    var width: CGFloat? = .infinity
    
    var body: some View {
        Button(
            action: { action() },
            label: {
                Text(LocalizedStringKey(string))
                    .padding(.XS)
                    .bold()
            }
        )
        .frame(width: width)
        .foregroundColor(.white)
        .background(Color.primaryPink)
        .cornerRadius(.XS)
        
    }
}

#Preview {
    LockQuoteButton(action: {}, string: "copyButton")
}
