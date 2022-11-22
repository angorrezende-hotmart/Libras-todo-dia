//
//  CardView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

final class CardView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let horizontalSpacing: CGFloat = 12.0
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalWidth: CGFloat = 324.0
        static let verticalWidth: CGFloat = 136.0
    }

    // MARK: - View Elements

    private let cardStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Constants.horizontalSpacing
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let imageView: CardImageView = {
        let view = CardImageView()

        return view
    }()

    private let thumnailComponent: Component<ThumbnailModel, Void> = {
        let view = Cosmos.makeThumbnail()

        return view
    }()

    private var thumnailView: UIView {
        thumnailComponent.view()
    }

    private let descriptionView: CardDescriptionView = {
        let view = CardDescriptionView()
        return view
    }()

    // MARK: - Constraints

    private lazy var widthConstraint: NSLayoutConstraint = widthAnchor.constraint(equalToConstant: Constants.verticalWidth)
    private lazy var descriptionWidthConstraint: NSLayoutConstraint = descriptionView.widthAnchor.constraint(equalTo: thumnailView.widthAnchor)

    // MARK: - Private Properties

    private var model: CardModel?

    // MARK: - Themed

    override func configurateColors() {
        guard let model = model else {
            return
        }

        bindViewModel(model)
    }

    // MARK: - Coded View

    override func addSubviews() {
        cardStackView.addArrangedSubview(thumnailView)
        cardStackView.addArrangedSubview(descriptionView)
        addSubview(cardStackView)
    }

    override func constrainSubviews() {
        layout(using: [
            widthConstraint,
        ])

        cardStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let viewModel = viewModel as? CardModel else {
            return
        }

        switch viewModel.orientation {
        case .horizontal:
            cardStackView.axis = .horizontal
            cardStackView.distribution = .fillProportionally
            cardStackView.alignment = viewModel.description.alignment
            cardStackView.spacing = Constants.horizontalSpacing

            widthConstraint.isActive = false
            descriptionWidthConstraint.isActive = false
        case .vertical:
            cardStackView.axis = .vertical
            cardStackView.distribution = .fill
            cardStackView.alignment = .leading
            cardStackView.spacing = Constants.verticalSpacing

            widthConstraint.isActive = true
            descriptionWidthConstraint.isActive = true
        }

        thumnailComponent.update(viewModel.image.getThumbnailModel())
        descriptionView.bindViewModel(viewModel)
        model = viewModel
    }

    func bindAction(_ action: ((CardAction) -> Void)?) {
        descriptionView.bindAction(action)
    }
}
