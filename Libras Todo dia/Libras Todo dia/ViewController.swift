//
//  ViewController.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 24/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark: Properties
    
    private let model = Alphabet()
    
    //View Especifica, Minha View, do meu Jeito
    private var customView: View? {
        view as? View
    }
    // Mark: View Life-Cyle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        // Aqui nao tem super
        // Crio Minha Custom View
        
        //Clientes
        view = View(dataSource: self)// Self = eu mesmo = ViewController
    
    }
}
//A Propria View Controller Vai ser Data Source
extension ViewController: UITableViewDataSource {
    
    //numero de secao da tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //numero de linhas = Qtd Letras em cada secao
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.letters.count // Quantidade de Letras
    }
    //Celula de cada linha, Mas primeiro preciso Registrar Celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //AQUI eu peço a TableView pra Devolver celula
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                as? LetterTableViewCell else {
            
            return UITableViewCell() // se der erro -> vazio
        }
        //Aqui Eu posso configurar celula
        let index = indexPath.row
        //model.letters = [A,B,C,D...]
        //index 0 = A
        //index 1 = B
        //index 2 = C
        let letter = model.letters[index]
        
        cell.backgroundColor = .lightGray
        cell.letterImageView.image = UIImage(named: letter.image)
        cell.titleLabel.text = letter.value
        
        //Memoria
        return cell
    }
}

/*
 
 Primeiro Passo
 
 (1) View Controller = ok
 (2) View (vai ser a View da Minha ViewController) = ok
 (3) Fonte de Dados [Model](array, collection, etc.) = ok
 (4) TableView com DataSource = ok
 (5) Imagem na Cell
 
*/
