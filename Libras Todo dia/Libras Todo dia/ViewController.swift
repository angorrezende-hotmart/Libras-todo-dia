//
//  ViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 24/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    private let model = Alphabet()
    
    
    // VIEW ESPECIFICA, MINHA VIEW, DO MEU JEITO
    private var customView: View? {
        view as? View
    }
    
    // MARK: View Life-Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        //AQUI não tem SUPER
        //CRIO MINHA Custom View
        view = View(dataSource: self)//self = eu mesmo = ViewController
    }
}

// A PROPRIA View Controller VAI ser Data Source
extension ViewController: UITableViewDataSource {
     
    //numero de Seção da Tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    //numero de Linhas = Qtd Letras em Cada Seçao
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.letters.count //Quantidade de Letras
    }
    
    //Celula de cada linha, MAS PRIMEIRO preciso REGISTRAR CELULA
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //AQUI eu peço a TableView pra Devolver Celula
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LetterTableViewCell else {
            
            return UITableViewCell()//se der erro -> vazio
        }
        // AQUI EU POSSO CONFIGURAR CELULA
        
        let index = indexPath.row
        //model.letters = [A, B, C, D ...]
        //index 0 = A
        //index 1 = B
        //index 2 = C
        let letter = model.letters[index]
        
        
        cell.backgroundColor = .lightGray
        cell.titleLabel.text = letter.value
        cell.letterImageView.image = UIImage(named: letter.image)
        
        return cell
    }
    
   
}


/*
 
 PRIMEIRO PASSO
 
 ok (1) View Controller
 ok (2) View (vai ser a View da Minha ViewController)
 ok (3) Fonte de Dados (model)(array, collection, etc.)
 ok (4) TableView com DataSource
    (5) Imagem na Cell
 
 */
 
