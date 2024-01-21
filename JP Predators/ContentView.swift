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
    @State var currentfilter = "All"  // default filter
    
    var body: some View {
        
        apController.filterBy(type: currentfilter)
        
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
                        withAnimation{
                            sortAlphabetical.toggle()
                        }
                    } label: {
                        if sortAlphabetical {
                            Image(systemName: "film")
                           
                        }
                        else{
                            Image(systemName: "textformat")
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Picker("Filter",selection: $currentfilter.animation()){
                            ForEach(apController.typefilters,id: \.self){ type in
                                HStack{
                                    Text(type)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    }
                    label:{
                        Image(systemName: "slider.horizontal.3")
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
