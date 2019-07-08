//
//  pets.swift
//  petpalMvp
//
//  Created by student on 03/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Pets{
    let nomePet: String
    let racaPet: String
    let nascimentoPet: String
    let pesoPet: String
    let imagemPet: String
    
    init(nomePet:String, racaPet:String, nascimentoPet:String, pesoPet:String, imagemPet:String) {
        self.nomePet = nomePet
        self.racaPet = racaPet
        self.nascimentoPet = nascimentoPet
        self.pesoPet = pesoPet
        self.imagemPet = imagemPet
    }
    
}

class PetsDAO {
    static func getPets() -> [Pets]{
        return[
            Pets(nomePet: "Doge", racaPet: "Cachorro", nascimentoPet: "12/04/2012", pesoPet: "28", imagemPet: "doge"),
            Pets(nomePet: "Cate", racaPet: "Gato", nascimentoPet: "06/09/2016", pesoPet: "4", imagemPet: "cate")
        ]
    }
}
