//
//  StartView.swift
//  LockQuote
//
//  Created by Anastasia on 27/10/23.
//

import SwiftUI

struct StartView: View {
    @StateObject var viewModel: StartViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBox(query: $viewModel.query) { query in
                    viewModel.destination = .search(query)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryPink)
            .background {
                NavigationLink(
                    isActive: $viewModel.destination.isActive(),
                    destination: { destination },
                    label: { EmptyView() }
                )
                .hidden()
            }
        }
    }
    
    @ViewBuilder
    private var destination: some View {
        switch viewModel.destination {
        case .search(let string):
            SearchResultsView(viewModel: .init(query: string))
        case .none:
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: .init())
    }
}
