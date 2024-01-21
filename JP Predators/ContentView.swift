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
    @State var sortAlphabetical = false
    
    var body: some View {
        
        if sortAlphabetical{
            apController.SortByAlphabetical()
        }
        else{
            apController.SortByMovieAppearance()
        }
        
       return NavigationView {
            List{
                ForEach(apController.apexPredators){ predator in
                    NavigationLink(destination:PredatorDetail(predator: predator)) {
                       PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        sortAlphabetical.toggle()
                    } label: {
                        if sortAlphabetical {
                            Image(systemName: "film")
                           
                        }
                        else{
                            Image(systemName: "textformat")
                        }
                    }
                }
            }
        }
       .preferredColorScheme(.dark) 
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
