//
//  ContentView.swift
//  Atividade prática 1  - App 2
//
//  Created by Filipe Xindanhi on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var message: String = ""
    @State var buttonDidTapped: Bool = false
    @State var answer = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Enter a Message", text: $message)
                        
                        Divider()
                        Button("SEND") {
                            buttonDidTapped = true
                        }
                    }
                } footer: {
                    if buttonDidTapped {
                        if message.isEmpty {
                            Text("Put some message")
                        } else {
                            Text("Message sent to another view")
                        }
                    } else {
                        Text("")
                    }
                }
                if buttonDidTapped {
                    NavigationLink(destination: View2(message: message), isActive: $answer, label: {
                        Button(action: {
                            
                            answer = true
                        }, label: {
                            Text("Go to other view")
                        })
                    })
                }
            } .navigationTitle("Atividade 2")
                .onAppear {
                    buttonDidTapped = false
                }
        }
    }
}


struct View2: View {
    var message: String
    
    var body: some View {
        Text(message)
    }
}

