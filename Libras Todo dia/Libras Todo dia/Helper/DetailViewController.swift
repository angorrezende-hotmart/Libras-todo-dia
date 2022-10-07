//
//  DetailViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 06/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    var letter: Letter!
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(letter.value)
        view.backgroundColor = .white
        view.addSubview(imageView)

        

        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("A", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
    }
    
    
}
