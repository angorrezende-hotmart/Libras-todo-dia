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
        view.addSubview(ImageView)//Isso adiciona o controlador de visualização sem restrições
        ImageViewConstraints() //Esta função está fora da função viewDidLoad que controla as restrições
        setupUI()
        
    }
    
//     Não se esqueça do .isActive = true após cada restrição
    func ImageViewConstraints() {
        ImageView.widthAnchor.constraint(equalToConstant: 370).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        ImageView.layer.cornerRadius = 40
        ImageView.layer.masksToBounds = true

    }
   
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "LETRA" + " " + letter.value
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        
//
//        // configurar imagem
//        if letter.value == "B" {
//            ImageView.image = UIImage(named: "beber")
//        } else if letter.value == "C" {
//            ImageView.image = UIImage(named: "caber")
//
//        } else if letter.value == "D" {
//            ImageView.image = UIImage(named: "dirigir")
//        }
        // OU ESTE
        
        ImageView.image = UIImage(named: "img-exemplo-" + letter.value.lowercased())
       
    }
    
}
