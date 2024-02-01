//
//  GameTaskOneView.swift
//  LockQuote
//
//  Created by Anastasia on 30/1/24.
//

import SwiftUI

struct GameTaskOneView: View {
    @StateObject var viewModel: GameTaskOneViewModel
    @FocusState private var focusedField: Int?
    
    var body: some View {
        VStack {
            Text("Memorisation in progress... TASK 1/5")
                .foregroundColor(.white)
                .padding(.XS)
            
            VStack {
                Text("Enter password exactly as it appears below:")
                    .padding(.XS)
                HStack {
                    ForEach(viewModel.pwdArray.indices, id: \.self) { index in
                        TextField(
                            viewModel.pwdArray[index],
                            text: $viewModel.input[index]
                        )
                        .focused($focusedField, equals: index)
                        .padding(6)
                        .fixedSize()
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .background(toggleColor(
                            text: viewModel.input[index],
                            index: index
                        ))
                        .cornerRadius(.XS)
                        .onChange(of: viewModel.input[index]) { value in
                            if value == viewModel.pwdArray[index] {
                                focusedField! += 1
                            } else {
                                focusedField! = focusedField!
                            }
                        }
                        .onChange(of: viewModel.input) { _ in
                            viewModel.check(index: index)
                            viewModel.checkAllCorrect()
                        }
                    }
                }
                .padding(.M)
                
                Button(action: {
                    viewModel.clearInput()
                    focusedField = nil
                }, label: {
                    Text(("Clear").uppercased())
                        .padding(.XS)
                        .foregroundColor(.white)
                        .background(Color.primaryPink)
                        .cornerRadius(.XS)
                        .bold()
                        
                })
                .padding(.S)
                
                if viewModel.done {
                    Text("FUCK YEAH!") // to do replace with lottie animation
                    .onAppear {
                        focusedField = nil
                    }
                    NavigationLink("Continue".uppercased(), destination: {
                        // to do navigate to game two
                    })
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .padding(.XS)
                    .background(Color.primaryPink)
                    .foregroundColor(.white)
                    .cornerRadius(.XS)
                    .bold()
                    .disabled(false)
                    .padding(.horizontal)
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
    
    private func toggleColor(text: String, index: Int) -> Color {
        let correct = viewModel.correct
        
        if text.isEmpty {
            return .lightGrey
        } else if correct[index]! {
            return .green
        } else {
            return .red
        }
    }
}

#Preview {
    GameTaskOneView(viewModel: .init(password: "YcBy4"))
}
