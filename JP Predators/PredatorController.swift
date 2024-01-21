//
//  PredatorController.swift
//  JP Predators
//
//  Created by Shoaib Ali on 07/01/24.
//

import Foundation


class PredatorController{

    var apexPredators: [ApexPredator] = []
    
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
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            }
            catch{
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    
    func SortByAlphabetical(){
        apexPredators.sort(by: { $0.name < $1.name})
    }
    
    func SortByMovieAppearance(){
        apexPredators.sort(by: {$0.id < $1.id})
    }
}
