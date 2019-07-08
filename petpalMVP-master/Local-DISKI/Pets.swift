//
//  Pets.swift
//  armazenamentoLocal
//
//  Created by student on 7/5/19.
//  Copyright © 2019 eduarda. All rights reserved.
//

import Foundation

class Pet {
    var nome: String
    var especie: String
    var raca: String!
    var idade: Int!
    var peso: Float!
    var guardiao: Usuario
    
    init(guardiao: Usuario, nome: String, especie: String, raca: String, idade: Int, peso: Float) {
        self.nome = nome
        self.especie = especie
        self.raca = raca
        self.idade = idade
        self.peso = peso
        self.guardiao = guardiao
    }
    
}

func getPetsList(banco: Banco) -> Array<Any> {
    
    var pets = [Array<Any>]()
    
    for us in banco.usuarios {
        pets.append(us.pets)
    }
    
    return pets
    
}
