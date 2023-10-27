//
//  StartView.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

struct StartView: View {
    @State private var query = ""
    
    var body: some View {
        VStack {
            SearchBox(query: $query)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primaryPink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
