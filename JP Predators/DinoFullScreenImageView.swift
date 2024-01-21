//
//  DinoFullScreenImageView.swift
//  JP Predators
//
//  Created by Shoaib Ali on 21/01/24.
//

import SwiftUI

struct DinoFullScreenImageView: View {
    let predator:ApexPredator
    var body: some View {
        
            ZStack(alignment:.trailing){
                
                
                Image(predator.name.lowercased().filter{ $0 != " "})
                    .resizable()
                    .scaledToFit()
                    .shadow(color:.black,radius:6,x:0,y: 0)
                    .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                    .shadow(color:.black,radius:6,x:0,y: 0)
                    .rotation3DEffect(.degrees(180),axis: (x:0, y: 1, z: 0))
                
                
            }
           
        
    }
   
}

