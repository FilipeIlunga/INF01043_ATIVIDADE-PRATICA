//
//  ContentView.swift
//  Atividade prática 1  - App 1
//
//  Created by Filipe Xindanhi on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var number1: String = ""
    @State var number2: String = ""
    @State var buttonDidTapped: Bool = false
 
    @State var sum: Int = 0
    
    var body: some View {
        
        NavigationView {
            
                Form {
                    Section {
                        TextField("Enter a number", text: $number1)
                            .keyboardType(.numberPad)
                            .onChange(of: number1) { newValue in
                                buttonDidTapped = false
                            }
                        TextField("Enter a number", text: $number2)
                            .keyboardType(.numberPad)
                            .onChange(of: number2) { newValue in
                                buttonDidTapped = false
                            }

                        HStack {
                            Spacer()
                            Button("SUM") {
                                buttonDidTapped = true
                               
                            }
                            Spacer()
                        }.listRowBackground(Color.gray.opacity(0.5))
                    }
                    
                    Section {
                        Text("Result: ")
                    }
                      
                }.navigationTitle("Atividade 1")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(number1: "", number2: "")
    }
}

