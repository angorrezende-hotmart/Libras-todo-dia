//
//  PillsCollectionViewCell.swift
//  HotmartCosmos
//
//  Created by Rafaela Dutra Nunes on 12/08/21.
//

import UIKit

final class PillsCollectionViewCell: ThemedCodedCollectionViewCell, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let titleSpacing: CGFloat = 9
    }

    // MARK: - View Elements

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.borderWidth = .one
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Cosmos.typography.body.text2.font
        label.textAlignment = .center
        return label
    }()

    // MARK: - Properties

    private var model: PillsItemModel?

    override var isSelected: Bool {
        didSet {
            guard let model = model else { return }
            bindViewModel(model)
        }
    }

    // MARK: - CodedCollectionViewCell

    override func addSubviews() {
        contentView.layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
    }

    override func constrainSubviews() {
        titleLabel.anchor(
            top: containerView.topAnchor,
            left: containerView.leftAnchor,
            bottom: containerView.bottomAnchor,
            right: containerView.rightAnchor,
            topConstant: Constants.titleSpacing,
            leftConstant: Spacing().spacing4.value,
            bottomConstant: Constants.titleSpacing,
            rightConstant: Spacing().spacing4.value
        )

        containerView.fillSuperview()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        updateSelected()
    }

    // MARK: - Private Methods

    private func updateSelected() {
        guard let model = model else { return }
        if model.selected {
            titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral100.color
            containerView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
            containerView.layer.borderColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color.cgColor
        } else {
            titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral600.color
            containerView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
            containerView.layer.borderColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color.cgColor
        }

        titleLabel.backgroundColor = .clear
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? PillsItemModel else {
            return
        }

        self.model = model
        titleLabel.text = model.title
        updateSelected()
    }
}
