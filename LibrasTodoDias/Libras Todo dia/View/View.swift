//
//  View.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 02/09/22.
//

import UIKit
import HotmartCosmos

final class View: UIView {
    
    // Mark: - View Elementos
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // COMPONENTES
    
    // Passo 1. Criar componente
    private lazy var buttonComponent: Component<ButtonModel, ButtonAction> = {
        //1. criar botao
        let button = Cosmos.makeButton()
        
        //update Model
        button.update(
            .init(
                title: "Exemplo",
                style: .secondary,
                icon: .right(icon: .externalLink),
                size: .medium,
                accessibility: nil
            )
        )
        
        //eventos
        button.onEvent? { [weak self]_ in
            print("clicou aqui")
        }
        return button
    }()
    
    // Cosmos -> UIKIT
    private lazy var buttonView = buttonComponent.view()
    
    
    // MARK: - Inicializador
    // VENDEDOR
    init(dataSource: UITableViewDataSource, delegate: UITableViewDelegate, frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
        tableView.dataSource = dataSource
        tableView.delegate = delegate
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
        addSubview(buttonView)
    }
    
    //Aplicar Constraints
    private func constrainSubviews() {
        constrainTableView()
        constrainButtonView()
    }
    
    //Constraints da Table View
    private func constrainTableView() {
        //Preenche Tudo
        tableView.fillSuperview()
    }
    
    //Constraints da ButtonView
    private func constrainButtonView() {
        buttonView.anchorCenterSuperview()// X e Y
    }
}
