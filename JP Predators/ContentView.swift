//
//  ContentView.swift
//  JP Predators
//
//  Created by Shoaib Ali on 07/01/24.
//

import SwiftUI

struct ContentView: View {
    
    // intialize predator controller
    let apController = PredatorController()
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(apController.apexPredators){ predator in
                    NavigationLink(destination:Text("Dino Details Go there.")) {
                        Text(predator.name)
                    }
                }
            }
            .navigationTitle("Apex Predators")
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
