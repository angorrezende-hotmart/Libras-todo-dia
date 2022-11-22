//
//  BottomSheetCardDescription.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 15/09/21.
//

import Foundation

final class BottomSheetCardDescriptionTableViewCell: ThemedCodedTableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let topConstant: CGFloat = 18.0
        static let leftConstant: CGFloat = 18.0
        static let bottomConstant: CGFloat = 10.0
        static let rightConstant: CGFloat = 18.0
    }

    // MARK: - View Elements

    private let cardDescriptionComponent: Component<CardModel, CardAction> = Cosmos.makeCardDescription()

    private lazy var cardDescriptionView: UIView = {
        let cardDescriptionView = cardDescriptionComponent.view()
        return cardDescriptionView
    }()

    private let separatorView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: Internal Properties

    var viewModel: ViewModel? {
        didSet {
            configureCell()
        }
    }

    // MARK: - Private Properties

    private var indexList: [Int] = []

    // MARK: - Coded View

    override func addSubviews() {
        contentView.addSubview(cardDescriptionView)
        contentView.addSubview(separatorView)
    }

    override func constrainSubviews() {
        constrainCardDescriptionView()
        constrainSeparatorView()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        separatorView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
    }

    // MARK: - Constrain Methods

    private func constrainCardDescriptionView() {
        cardDescriptionView.anchor(
            top: separatorView.bottomAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor,
            topConstant: Constants.topConstant,
            leftConstant: Constants.leftConstant,
            bottomConstant: Constants.bottomConstant,
            rightConstant: Constants.rightConstant
        )
    }

    private func constrainSeparatorView() {
        separatorView.anchor(
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            right: contentView.rightAnchor,
            heightConstant: .one
        )
    }

    // MARK: - Private Methods

    private func configureCell() {
        guard let viewModel = viewModel else { return }

        selectionStyle = .none
        separatorView.isHidden = viewModel.separatorHidden

        cardDescriptionComponent.update(viewModel.cardModel)
    }
}

// MARK: - ViewModel

extension BottomSheetCardDescriptionTableViewCell {
    struct ViewModel {
        let cardModel: CardModel
        let section: Int
        let separatorHidden: Bool
    }
}
