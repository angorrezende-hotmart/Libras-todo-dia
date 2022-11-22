//
//  CardDescriptionView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

final class CardDescriptionView: ThemedCodedView, Bindable {
    // MARK: - Button Component

    private let buttonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()
    private let tagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = 4
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let progressStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let textStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let tagStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let priceStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let buttonStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = .zero
            $0.distribution = .fill
            $0.alignment = .leading
        }

        return stackView.build()
    }()

    private let progressView: UIProgressView = {
        let progressView = UIProgressView()

        return progressView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        return view
    }()

    private let authorLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        return view
    }()

    private let priceLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private let promotionLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private lazy var buttonView: UIView = {
        let view = buttonComponent.view()
        return view
    }()

    private lazy var tagView: UIView = {
        let view = tagComponent.view()
        return view
    }()

    // MARK: - Fake Spacing Views

    private let centerSpacingView: UIView = .init()

    private let leftSpacingView: UIView = {
        let view = UIView()
        return view
    }()

    private let rightSpacingView: UIView = {
        let view = UIView()
        return view
    }()

    private let bottomSpacingView: UIView = .init()

    // MARK: - Constraints

    private lazy var titleLabelHeigthConstraint: NSLayoutConstraint = titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: .zero)

    private lazy var authorLabelHeigthConstraint: NSLayoutConstraint = authorLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: .zero)

    private lazy var priceLabelHeigthConstraint: NSLayoutConstraint = priceLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: .zero)

    private lazy var promotionLabelHeigthConstraint: NSLayoutConstraint = promotionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: .zero)

    // MARK: - Properties

    private var model: CardModel.Description?
    private static let defaultNumberOfLines: Int = 2

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let model = model else { return }

        configureDescription(model)
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(progressStackView)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(tagStackView)
        mainStackView.addArrangedSubview(priceStackView)
        mainStackView.addArrangedSubview(centerSpacingView)
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(bottomSpacingView)

        progressStackView.addArrangedSubview(progressView)
        progressStackView.addSpacingViewOfHeight(Spacing().spacing2.value)

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(authorLabel)

        tagStackView.addArrangedSubview(tagView)
        tagStackView.addArrangedSubview(UIView())

        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(promotionLabel)

        buttonStackView.addArrangedSubview(leftSpacingView)
        buttonStackView.addArrangedSubview(buttonView)
        buttonStackView.addArrangedSubview(rightSpacingView)
    }

    override func constrainSubviews() {
        constrainMainStackView()
        constrainLabels()
    }

    // MARK: - Constrain Methods

    private func constrainMainStackView() {
        mainStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    private func constrainLabels() {
        titleLabel.layout(using: [
            titleLabelHeigthConstraint,
        ])

        authorLabel.layout(using: [
            authorLabelHeigthConstraint,
        ])

        priceLabel.layout(using: [
            priceLabelHeigthConstraint,
        ])

        promotionLabel.layout(using: [
            promotionLabelHeigthConstraint,
        ])

        progressView.anchor(heightConstant: Spacing().spacing1.value)

        leftSpacingView.anchor(heightConstant: Spacing().spacing5.value)
        rightSpacingView.anchor(heightConstant: Spacing().spacing5.value)
    }

    // MARK: - Private Methods

    private func configureLabelVisual(
        _ label: UILabel,
        numberOfLines: Int = defaultNumberOfLines,
        withTypography systemTypography: SystemTypography?,
        andColor systemColor: SystemColor?
    ) {
        label.numberOfLines = numberOfLines
        label.font = systemTypography?.font
        label.textColor = systemColor?.color
    }

    private func configureLabel(
        _ label: UILabel,
        text: String?
    ) {
        label.text = text
        label.isHidden = text == nil
    }

    private func configureProgress(_ description: CardModel.Description) {
        progressView.progressTintColor = Cosmos.colors.primaryBrandColor.color.color

        switch description {
        case let .desc7(_, _, _, _, progress, fullColor):
            progressStackView.isHidden = false
            progressView.setProgress(progress, animated: false)

            if progress >= .one {
                progressView.progressTintColor = fullColor?()
            }

        default:
            progressView.setProgress(.zero, animated: true)
            progressStackView.isHidden = true
        }
    }

    private func configureTitleAndAuthor(withDescription description: CardModel.Description) {
        let descriptionStyle = description.system

        switch description {
        case let .desc1(title, titleNumberOfLines, author, authorNumberOfLines),
             let .desc2(title, titleNumberOfLines, author, authorNumberOfLines, _, _),
             let .desc3(title, titleNumberOfLines, author, authorNumberOfLines, _),
             let .desc4(title, titleNumberOfLines, author, authorNumberOfLines, _),
             let .desc5(title, titleNumberOfLines, author, authorNumberOfLines, _, _),
             let .desc6(title, titleNumberOfLines, author, authorNumberOfLines),
             let .desc7(title, titleNumberOfLines, author, authorNumberOfLines, _, _),
             let .desc8(title, titleNumberOfLines, author, authorNumberOfLines, _),
             let .desc9(title, titleNumberOfLines, author, authorNumberOfLines):

            configureLabelVisual(
                titleLabel,
                numberOfLines: titleNumberOfLines ?? CardDescriptionView.defaultNumberOfLines,
                withTypography: descriptionStyle.titleTypography,
                andColor: descriptionStyle.titleColor
            )
            configureLabelVisual(
                authorLabel,
                numberOfLines: authorNumberOfLines ?? CardDescriptionView.defaultNumberOfLines,
                withTypography: descriptionStyle.authorTypography,
                andColor: descriptionStyle.authorColor
            )

            configureLabel(
                titleLabel,
                text: title
            )

            configureLabel(
                authorLabel,
                text: author
            )
        }
    }

    private func configurePriceIfNeeded(withDescription description: CardModel.Description) {
        let descriptionStyle = description.system

        switch description {
        case let .desc4(_, _, _, _, price),
             let .desc5(_, _, _, _, price, _),
             let .desc8(_, _, _, _, price):
            configureLabelVisual(
                priceLabel,
                withTypography: descriptionStyle.priceTypography,
                andColor: descriptionStyle.priceColor
            )

            configureLabel(
                priceLabel,
                text: price
            )
        case .desc1, .desc2, .desc3, .desc6, .desc7, .desc9:
            break
        }
    }

    private func configurePromotionIfNeeded(withDescription description: CardModel.Description) {
        let descriptionStyle = description.system

        switch description {
        case let .desc5(_, _, _, _, _, promotion):
            configureLabelVisual(
                promotionLabel,
                withTypography: descriptionStyle.promotionTypography,
                andColor: descriptionStyle.promotionColor
            )
            configureLabel(
                promotionLabel,
                text: promotion
            )
        case .desc1, .desc2, .desc3, .desc4, .desc6, .desc7, .desc8, .desc9:
            break
        }
    }

    private func configuraTagIfNeeded(withDescription description: CardModel.Description) {
        switch description {
        case let .desc2(_, _, _, _, tagText, tagStyle):
            let model = TagModel(text: tagText, style: tagStyle)
            tagComponent.update(model)
            tagStackView.isHidden = false
        case .desc1, .desc3, .desc4, .desc5, .desc6, .desc7, .desc8, .desc9:
            tagStackView.isHidden = true
        }
    }

    private func configureButtonIfNeeded(withDescription description: CardModel.Description) {
        if let model = description.system.buttonModel {
            buttonComponent.update(model)
            buttonStackView.isHidden = false
            bottomSpacingView.isHidden = true
        } else {
            buttonStackView.isHidden = true
            bottomSpacingView.isHidden = true
        }
    }

    private func configureDescription(_ description: CardModel.Description) {
        configureProgress(description)
        configureTitleAndAuthor(withDescription: description)
        configuraTagIfNeeded(withDescription: description)
        configurePriceIfNeeded(withDescription: description)
        configurePromotionIfNeeded(withDescription: description)
        configureButtonIfNeeded(withDescription: description)
    }

    private func configureOrientation(_ orientation: CardModel.Orientation) {
        switch orientation {
        case .horizontal:
            leftSpacingView.isHidden = false
            rightSpacingView.isHidden = true
            buttonStackView.alignment = .trailing

        case .vertical:
            leftSpacingView.isHidden = true
            rightSpacingView.isHidden = false
            buttonStackView.alignment = .leading
        }
    }

    private func resetView() {
        titleLabel.text = nil
        authorLabel.text = nil
        tagStackView.isHidden = true
        priceLabel.text = nil
        promotionLabel.text = nil
        buttonStackView.isHidden = true
    }

    // MARK: - Internal Methods

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let viewModel = viewModel as? CardModel else {
            return
        }

        model = viewModel.description

        resetView()
        configureDescription(viewModel.description)
        configureOrientation(viewModel.orientation)

        layoutSubviews()
    }

    func bindAction(_ action: ((CardAction) -> Void)?) {
        let buttonAction: ((ButtonAction) -> Void)? = { _ in
            action?(.secondaryButtonTap)
        }

        buttonComponent.onEvent?(buttonAction)
    }
}
