//
//  PredatorRow.swift
//  JP Predators
//
//  Created by Shoaib Ali on 08/01/24.
//

import SwiftUI

struct PredatorRow:View {
    
    let predator:ApexPredator
    
    
    var body: some View {
        
        HStack{
            // Dino Image
            Image(predator.name.lowercased().filter{ $0 != " "})
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                .shadow(color:.white,radius:1,x:0,y:0)
            
            VStack(alignment:.leading){
                //Name
                Text(predator.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                //Type
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,13)
                    .padding(.vertical,5)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    }
                    
            }
        }
    }
}




struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        let moviescene=MovieScene(id:1, movie: "Jurassic Park", sceneDescription: "A velociraptor appears in the very first scene in Jurassic Park when Muldoon and his team try to bring a female into the park. It attacks one of the team members and they are forced to shoot it. They don’t appear then until far later in the film when Ellie and Muldoon have to restore the park’s power systems. Muldoon realises they’re being hunted by them and tells Ellie to run to the power shed as he tracks a Velociraptor with his gun. She restores the power and finds what’s left of Ray and she narrowly escapes from a Velociraptor. Muldoon is still tracking a raptor when the female ambushes him, killing him. The raptors appear again in the visitor center when Lex and Tim are eating. They hide in the kitchen and avoid being detected. They managed to trap one of them and escape. The raptors catch up with the group in the control room so Ellie, Dr. Grant, Tim and Lex escape through the vents and into the main lobby area of the visitor center. They fall to the ground and are about to be attacked by two Velociraptors when the Tyrannosaur appears, killing both of them. The survivors use this opportunity to escape the island.")
        
        let predator = ApexPredator(id: 3, name: "Velociraptor", type: "land", movies: ["Jurassic Park","The Lost World: Jurassic Park","Jurassic Park III","Jurassic World","Jurassic World: Fallen Kingdom"], movieScenes: [moviescene], link:"https://jurassicpark.fandom.com/wiki/Velociraptor")
        
    
        PredatorRow(predator: predator)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.sizeThatFits)
           
    }
}
