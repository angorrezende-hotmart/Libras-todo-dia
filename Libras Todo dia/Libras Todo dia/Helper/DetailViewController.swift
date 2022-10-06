//
//  DetailViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 06/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    var letter: Letter!
    let img = ["aviao","barco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(letter.value)
        
        view.backgroundColor = .white

    }

    
}



