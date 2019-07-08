//
//  Usuario.swift
//  armazenamentoLocal
//
//  Created by student on 7/5/19.
//  Copyright © 2019 eduarda. All rights reserved.
//

import Foundation

class Usuario {
    var nome: String
    var senha: String
    
    var pets = [Pet]()
    
    init(nome: String, senha: String) {
        self.nome = nome
        self.senha = senha
    }
    
    func addPet(pet: Pet) {
        pets.append(pet)
    }

}

func UsuarioDAO(banco: Banco) -> Array<Any> {
    return banco.usuarios
}
