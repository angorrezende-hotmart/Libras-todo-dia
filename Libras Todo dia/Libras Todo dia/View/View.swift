//
//  View.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 02/09/22.
//

import UIKit

final class View: UIView {
    
    // Mark: - View Elementos
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // MARK: - Inicializador
    // VENDEDOR
    init(dataSource: UITableViewDataSource,  frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
        tableView.dataSource = dataSource
    }
    
    
    //Obrigatorio Isso mas podemos Desabilitar Chamada
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurar View (cor, frame, subViews, constrains)
    
    private func configureView() {
        backgroundColor = .gray //Cinza
        addSubViews()
        registerCells()
        constrainSubviews()
    }
    // CELL = Celula (TableViewCell = Linha)
    private func registerCells() {
        tableView.register(LetterTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    //Adiciono cada elemento na tela
    private func addSubViews() {
        addSubview(tableView)
    }
    //Aplicar Constraints
    private func constrainSubviews() {
        constrainTableView()
    }
    //Constraints da Table View
    private func constrainTableView() {
        //Preenche Tudo
        tableView.fillSuperview()
    }
}
