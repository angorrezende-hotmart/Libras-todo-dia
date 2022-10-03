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
            Letter(value: "C"),
            Letter(value: "D"),
            Letter(value: "E"),
            Letter(value: "F"),
            Letter(value: "G"),
            Letter(value: "H"),
            Letter(value: "I"),
            Letter(value: "J"),
            Letter(value: "K"),
            Letter(value: "L"),
            Letter(value: "M"),
            Letter(value: "N"),
            Letter(value: "O"),
            Letter(value: "P"),
            Letter(value: "Q"),
            Letter(value: "R"),
            Letter(value: "S"),
            Letter(value: "T"),
            Letter(value: "U"),
            Letter(value: "V"),
            Letter(value: "W"),
            Letter(value: "X"),
            Letter(value: "Y"),
            Letter(value: "Z")
            
        ]
        
    }
}
