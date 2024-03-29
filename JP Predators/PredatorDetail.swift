//
//  PredatorDetail.swift
//  JP Predators
//
//  Created by Shoaib Ali on 14/01/24.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator:ApexPredator
    var body: some View {
         
            ScrollView{
                VStack(alignment:.trailing){
                    ZStack(alignment: .trailing) {
                                       Image(predator.type)
                                           .resizable()
                                           .scaledToFit()
                                           .offset(y: -110)
                                       
                                       NavigationLink(destination: DinoFullScreenImageView(predator: predator)) {
                                           Image(predator.name.lowercased().filter { $0 != " " })
                                               .resizable()
                                               .scaledToFit()
                                               .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
                                               .shadow(color: .black, radius: 6, x: 0, y: 0)
                                               .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                       }
                                     
                                   }
                   
                    
                    
                    
                    VStack(alignment:.leading){
                        Text(predator.name)
                            .font(.largeTitle)
                            .padding(.bottom,8)
                        
                        Text("Appears In:")
                            .font(.title3)
                        
                        ForEach(predator.movies, id: \.self){movie in
                            Text("•"+movie)
                        }
                        
                        Text("Movie Moments")
                            .font(.title)
                            .padding(.top,15)
                        
                        ForEach(predator.movieScenes){ scene in
                            Text(scene.movie)
                                .font(.title2)
                                .padding([.top,.bottom],1)
                            
                            Text(scene.sceneDescription)
                                .padding(.bottom,15)
                        }
                        
                        
                        Text("Read More")
                            .font(.caption)
                        Link(predator.link, destination: URL(string: predator.link)!)
                            .font(.caption)
                            .foregroundColor(.blue)
                        
                    }
                        .padding()
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
            }
        }
        
        
    }

    
    
    
    struct PredatorDetail_Previews: PreviewProvider {
        static var previews: some View {
            let moviescene1=MovieScene(id:1, movie: "Jurassic Park", sceneDescription: "A velociraptor appears in the very first scene in Jurassic Park when Muldoon and his team try to bring a female into the park. It attacks one of the team members and they are forced to shoot it. They don’t appear then until far later in the film when Ellie and Muldoon have to restore the park’s power systems. Muldoon realises they’re being hunted by them and tells Ellie to run to the power shed as he tracks a Velociraptor with his gun. She restores the power and finds what’s left of Ray and she narrowly escapes from a Velociraptor. Muldoon is still tracking a raptor when the female ambushes him, killing him. The raptors appear again in the visitor center when Lex and Tim are eating. They hide in the kitchen and avoid being detected. They managed to trap one of them and escape. The raptors catch up with the group in the control room so Ellie, Dr. Grant, Tim and Lex escape through the vents and into the main lobby area of the visitor center. They fall to the ground and are about to be attacked by two Velociraptors when the Tyrannosaur appears, killing both of them. The survivors use this opportunity to escape the island.")
            
            let moviescene2=MovieScene(id:2, movie: "The Lost World: Jurassic Park", sceneDescription: "The Velociraptors appear once again towards the end of The Lost World. When Roland’s team escape the Tyrannosaurus at their camp, they wonder into the tall grass. The raptors close in on them and start picking the team off one by one. Dr. Malcolm, Kelly and Sarah make it to the compound in the middle of the island. One of the raptors jumps on Sarah’s backpack and Sarah and Kelly flee into a nearby building with two raptors in pursuit. Malcolm tires to evade the other one by hiding in a nearby building and then inside a car. The other two velociraptors make it inside the building and Sarah and Kelly climb to the top. Kelly uses her acrobatic skills to impale a raptor on a metal pole. They escape through the top of the building with the other one right behind them. It falls off the roof and onto the other raptor on the ground. They start fighting each other which gives Sarah and Kelly the opportunity to escape.")
            
            let predator = ApexPredator(id: 3, name: "Velociraptor", type: "land", movies: ["Jurassic Park","The Lost World: Jurassic Park","Jurassic Park III","Jurassic World","Jurassic World: Fallen Kingdom"], movieScenes: [moviescene1,moviescene2], link:"https://jurassicpark.fandom.com/wiki/Velociraptor")
            
            
            PredatorDetail(predator: predator)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
        }
    }

