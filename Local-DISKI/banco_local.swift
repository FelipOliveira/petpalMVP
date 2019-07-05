//
//  banco_local.swift
//  armazenamentoLocal
//
//  Created by student on 7/5/19.
//  Copyright © 2019 eduarda. All rights reserved.
//

import Foundation

class Banco {
    var usuarios = [Usuario]()
    
    init(){}
    
    func addUsuario(usuario: Usuario) {
        self.usuarios.append(usuario)
    }
}
