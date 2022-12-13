//
//  ContentView.swift
//  Atividade prática 1  - App 3
//
//  Created by Filipe Xindanhi on 12/12/22.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    var motion = CMMotionManager()
    @State var showAnotherView = false

    @State var x: Double = 0.0
    @State var y: Double = 0.0
    @State var z: Double = 0.0

    var body: some View {
        
        NavigationView {
            HStack {
             
                Text("X: \(x)")
                    .shadow(radius: 1, x: x, y: y)
                Text("Y: \(y)")
                Text("Z: \(z)")
                    .shadow(color: Color.green,radius: 2, y: CGFloat(Double()))
                
                NavigationLink(destination: View2(), isActive: $showAnotherView, label: {
                    EmptyView()
                })

            }.onAppear {
                myAccel()
                showAnotherView = false
            }.navigationTitle("Atividade 3")
            
        }
    }
    
    func myAccel() {
        motion.accelerometerUpdateInterval = 0.4
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            
            if let myData = data {
                if myData.acceleration.x > 0.5 || myData.acceleration.z > 0.5 || myData.acceleration.y > 0.5 {
                    showAnotherView = true
                }
                
                x = Double(String(format: "%.5f", myData.acceleration.x))!
                y = Double(String(format: "%.5f", myData.acceleration.y))!
                z = Double(String(format: "%.5f", myData.acceleration.z))!
            }
        }
    }
}

struct View2: View {
    
    var body: some View {
        Text("Acelerou demais, camarada.\n Cuidado para não derrubar o celular!")
    }
}

