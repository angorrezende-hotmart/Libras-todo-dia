//
//  LibrasModel.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 02/09/22.
//

import Foundation

// Letter = Letra
struct Letter {
    let value: String
    let image: String
    
    init(value: String) {
        self.value = value
        self.image = "Letter-" + value
    }
}

//Grupo de Letras

struct Alphabet {
    let letters: [Letter]// Alfabeto é lista de Letras
    
    //Eu vou preenche todas as letras
    init() {
        letters = [
            Letter(value: "A"),
            Letter(value: "B"),
            Letter(value: "C")
        ]
        
    }
}
