//
//  LetterTableViewCell.swift
//  Libras Todo dia
//
//  Created by Angor Volpi Silva Rezende on 02/09/22.
//

import Foundation

import UIKit

final class LetterTableViewCell: UITableViewCell {
    
    var letterImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var  titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    //Tem que ter isso
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    @available(*,unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from I8.")
    }
    private func configureView() {
        addSubviews()
        constraintViews()
    }
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(letterImageView)
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3.0, height: 10.0)
        contentView.layer.shadowRadius = 25.0
        contentView.layer.shadowOpacity = 9.0
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 20
        contentView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 2).cgColor
        
    }
    private func constraintViews() {
        constrainTitleLabel()
        constrainLetterImageView()
    
    }
    // Text esquerda mas maximo na letra
    private func constrainTitleLabel() {
        titleLabel.anchor(
            leading: leadingAnchor,
            trailing: letterImageView.leadingAnchor,
            leadingConstant: 25,
            heightConstant: 50
        )
        
        titleLabel.anchorCenterYToSuperview()
    }
    // Imagem a direita
    private func constrainLetterImageView() {
        letterImageView.anchor(
            top: topAnchor,
            trailing: trailingAnchor,
            trailingConstant: 1.9,
            widthConstant: 80,
            heightConstant: 50
            
        )
        
        letterImageView.anchorCenterYToSuperview()
    }
}
