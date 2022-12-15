//
//  ContentView.swift
//  AtividadePratica_2_App_1
//
//  Created by Filipe Xindanhi on 15/12/22.
//

import SwiftUI
import CoreLocation
import CoreMotion

struct ContentView: View {
    @State var latitude: CLLocationDegrees = 0.0
    @State var longitude: CLLocationDegrees = 0.0
    
    @State var x: Double = 0.0
    @State var y: Double = 0.0
    @State var z: Double = 0.0

    @State var timer: Timer?
    
    var motion = CMMotionManager()
    
    var locationManager = CLLocationManager()
    
    @State var showLocation: Bool = false
    @State var showGyros: Bool = false

    var body: some View {
        
        NavigationView {
            VStack {

                Button {
                    showLocation.toggle()
                } label: {
                    Text( "\(showLocation ? "Ocultar" : "Exibir")" + " latitude e longitute")
                }.buttonStyle(.borderedProminent)

                if showLocation {
                    Text("Latitude: \(latitude)")
                    Text("Logintude: \(longitude)")
                }
                
                Button {
                    showGyros.toggle()
                } label: {
                    Text( "\(showGyros ? "Ocultar" : "Exibir")" + " Giroscopio")
                }.buttonStyle(.borderedProminent)
                                
                if showGyros {
                    Text("X: \(x) - Y \(y) - Z: \(z)")
                }
            }
            .padding()
            .onAppear {
                getLocation()
                startGyros()
            }
            .onDisappear {
                stopGyros()
            }
            .navigationTitle("Atividade Pratica 2")

        }
        
    }
                             
    func stopGyros() {
        if self.timer != nil {
            self.timer?.invalidate()
            self.motion.stopGyroUpdates()
        }
    }
                             
    
     func startGyros() {
       if motion.isGyroAvailable {
          self.motion.gyroUpdateInterval = 10.0 / 60.0
          self.motion.startGyroUpdates()

          self.timer = Timer(fire: Date(), interval: (10.0/60.0),
                 repeats: true, block: { (timer) in
             if let data = self.motion.gyroData {
                 self.x = data.rotationRate.x
                 self.y = data.rotationRate.y
                 self.z = data.rotationRate.z

             }
          })

           RunLoop.current.add(self.timer!, forMode: .default)
       }
    }
    
     func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
            latitude = currentLoc.coordinate.latitude
            longitude = currentLoc.coordinate.longitude
        }
    }
}

