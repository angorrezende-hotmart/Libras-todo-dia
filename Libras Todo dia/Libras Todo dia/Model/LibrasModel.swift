//
//  LibrasModel.swift
//  Libras Todo dia
//
//  Created by Rafael Bruno Costa dos Reis on 01/09/22.
//

import Foundation

//Letra NAO é String
struct Letter {
    let value: String
    let image: String
    
    init(value: String) {
        self.value = value
        self.image = "letter-" + value.lowercased()// A -> a
    }
}


//Grupo de Letras
struct Alphabet {
    let letters: [Letter]// Alfabeto é lista de Letras
    
    //eu vou preencher todas as letras
    init() {
        letters = [
            Letter(value: "A"),
            Letter(value: "B"),
            Letter(value: "C")
        ]
    }
}
