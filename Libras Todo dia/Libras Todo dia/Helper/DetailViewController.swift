//
//  DetailViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 06/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    var letter: Letter!
    
    
    let ImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "aviao")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
        //Você precisa chamar esta propriedade para que a imagem seja adicionada à sua visualização
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(letter.value)
        view.backgroundColor = .systemGray4
        
        view.addSubview(ImageView) //Isso adiciona o controlador de visualização sem restrições
        ImageViewConstraints() //Esta função está fora da função viewDidLoad que controla as restrições
    }
    // não se esqueça do .isActive = true após cada restrição
    func ImageViewConstraints() {
        ImageView.widthAnchor.constraint(equalToConstant: 380).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        ImageView.layer.cornerRadius = 20
        ImageView.layer.masksToBounds = true
        
    }
    
      
}
