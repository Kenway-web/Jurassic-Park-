//
//  PredatorController.swift
//  JP Predators
//
//  Created by Shoaib Ali on 07/01/24.
//

import Foundation


class PredatorController{
  private var allpexPredators:[ApexPredator]=[]
    var apexPredators: [ApexPredator] = []
    let typefilters = ["All","Land","Air","Sea"]
    
    init(){
        decodeApexPredator()
    }
    
    // Decode
    func decodeApexPredator(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data = try  Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allpexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators=allpexPredators
            }
            catch{
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func typeIcon(for type:String) -> String{
        switch type{
        case "All":return "square.stack.3d.up.fill"
        case "Land":return "leaf.fill"
        case "Air":return "wind"
        case "Sea":return "drop.fill"
        default: return "questionmark"
        }
    }
    
    func filterBy(type:String){
        switch type {
        case "Land","Air","Sea":
            apexPredators = allpexPredators.filter{
                $0.type == type.lowercased()
            }
        default:apexPredators = allpexPredators
        }
    }
    
    func SortByAlphabetical(){
        apexPredators.sort(by: { $0.name < $1.name})
    }
    
    func SortByMovieAppearance(){
        apexPredators.sort(by: {$0.id < $1.id})
    }
    
    
}
