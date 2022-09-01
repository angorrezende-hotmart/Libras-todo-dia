//
//  LetterTableViewCell.swift
//  Libras Todo dia
//
//  Created by Rafael Bruno Costa dos Reis on 01/09/22.
//

import Foundation
import UIKit

final class LetterTableViewCell: UITableViewCell {
    
    var letterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit//magica
        
        return imageView
    }()
    
    var titleLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    //tem que ter isso
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }
    
    private func configureView() {
        addSubviews()
        constraintViews()
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(letterImageView)
    }
    
    private func constraintViews() {
        constrainTitleLabel()
        constrainLetterImageView()
    }
    
    // texto esquerda mas maximo na letra
    private func constrainTitleLabel() {
        titleLabel.anchor(
            leading: leadingAnchor,
            trailing: letterImageView.leadingAnchor,
            leadingConstant: 16,
            heightConstant: 24.0
        )
        
        titleLabel.anchorCenterYToSuperview()
    }
    
    // imagem a direita
    private func constrainLetterImageView() {
        letterImageView.anchor(
            top: topAnchor,
            trailing: trailingAnchor,
            trailingConstant: 16,//margem
            widthConstant: 40,
            heightConstant: 40
        )
        
        letterImageView.anchorCenterYToSuperview()
    }
}
