//
//  View.swift
//  Libras Todo dia
//
//  Created by Rafael Bruno Costa dos Reis on 01/09/22.
//

import UIKit

final class View: UIView {
    
    // MARK: - View Elementos
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        
        return tableView
    }()
    
    
    // MARK: - Inicializador
    
    init(dataSource: UITableViewDataSource, frame: CGRect = .zero) {
        super.init(frame: frame)
        tableView.dataSource = dataSource
        configureView()
    }
    
    //OBRIGATORIO ISSO MAS PODEMOS DESABILITAR CHAMADA
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurar View (cor, frame, subViews, constraints)
    
    private func configureView() {
        backgroundColor = .gray//cinza
        addSubViews()
        registerCells()
        constrainSubviews()
    }
    
    // CEll = Celula (TableViewCell = Linha)
    private func registerCells() {
        tableView.register(LetterTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // ADICIONO CADA ELEMENTO NA TELA
    private func addSubViews() {
        addSubview(tableView)
    }
    
    
    // APLICAR CONSTRAINTS
    private func constrainSubviews() {
        constrainTableView()
    }
    
    // Constraints da Table View
    private func constrainTableView() {
        //preenche tudo
        tableView.fillSuperview()
    }
    
}
