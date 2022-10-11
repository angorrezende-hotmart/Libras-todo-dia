//
//  Photos.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 11/10/22.
//

import UIKit

class Photos {
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        
        image = UIImage(named: self.name)!
    }
}
