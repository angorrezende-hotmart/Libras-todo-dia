//
//  ViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 24/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let imageView = UIImageView(image: UIImage(named: "Alfabeto")!)
        view.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false

            let trailingAnchor = imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            let topAnchor = imageView.topAnchor.constraint(equalTo: view.topAnchor)
            let leadingAnchor = imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            let widthAnchor = imageView.widthAnchor.constraint(equalToConstant: 430)
            let heightAnchor = imageView.heightAnchor.constraint(equalToConstant: 900)
            let topAnchor = imageView.topAnchor.constraint(equalToConstant: 100)
            NSLayoutConstraint.activate([trailingAnchor,topAnchor, leadingAnchor, widthAnchor, heightAnchor,topAnchor])
        
    }


}
