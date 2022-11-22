//
//  OutlinedCardView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 12/11/21.
//

import Foundation

final class OutlinedCardView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private lazy var roundedView: UIView = {
        let view = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.addGestureRecognizer(tap)
        return view
    }()

    private let contentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
        }.build()

        return stackView
    }()

    private let topContentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let iconImage: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let topTagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    private lazy var topTagView: UIView = {
        let view = topTagComponent.view()
        return view
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 4
        return view
    }()

    private let bottomContentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let bottomTagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    private lazy var bottomTagView: UIView = {
        let view = bottomTagComponent.view()
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    // MARK: - Constraints

    private lazy var roundedViewWidthConstraint: NSLayoutConstraint = roundedView.widthAnchor.constraint(equalToConstant: .zero)

    // MARK: - Private properties

    private var system: SystemOutlinedCard?
    private var action: ((OutlinedCardAction) -> Void)?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(roundedView)
        roundedView.addSubview(contentStackView)
    }

    override func constrainSubviews() {
        constrainRoundedView()
        constrainContentStackView()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system else {
            return
        }

        roundedView.layer.borderColor = system.colors.stroke.color.cgColor
        iconImage.tintColor = system.colors.icon.color
        titleLabel.textColor = system.colors.title.color
        descriptionLabel.textColor = system.colors.description.color
        backgroundColor = system.colors.background.color
    }

    // MARK: - Constraint Methods

    private func constrainRoundedView() {
        roundedView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )

        roundedView.layout(using: [
            roundedViewWidthConstraint,
        ])
    }

    private func constrainContentStackView() {
        contentStackView.anchor(
            top: roundedView.topAnchor,
            leading: roundedView.leadingAnchor,
            trailing: roundedView.trailingAnchor,
            topConstant: Spacing().spacing3.value,
            leadingConstant: Spacing().spacing3.value,
            trailingConstant: Spacing().spacing3.value
        )

        let bottomConstraint = contentStackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -Spacing().spacing3.value)
        bottomConstraint.priority = UILayoutPriority.defaultLow
        contentStackView.layout(using: [
            bottomConstraint,
        ])
    }

    // MARK: - Private methods

    private func setupCardArrangement(system: SystemOutlinedCard, style: OutlinedCardModel.Style) {
        contentStackView.removeSubviews()
        topContentStackView.removeSubviews()

        contentStackView.addArrangedSubview(topContentStackView)
        contentStackView.addSpacingViewOfHeight(system.metrics.spacingBetweenIconAndTitle)

        topContentStackView.addArrangedSubview(iconImage)
        topContentStackView.addSpacingView()
        topContentStackView.addArrangedSubview(topTagView)

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addSpacingViewOfHeight(system.metrics.spacingBetweenTitleAndDescription)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addSpacingViewOfHeight(system.metrics.contentSpacing)
        contentStackView.addArrangedSubview(bottomContentStackView)

        bottomContentStackView.addArrangedSubview(bottomTagView)
        bottomContentStackView.addSpacingView()
    }

    private func setupFonts(system: SystemOutlinedCard) {
        titleLabel.font = system.typography.title.font
        descriptionLabel.font = system.typography.description.font
    }

    private func setupForStyle(_ style: OutlinedCardModel.Style, tagModel: TagModel?) {
        switch style {
        case let .default(description):
            descriptionLabel.isHidden = false
            descriptionLabel.text = description

            topTagView.isHidden = true
            roundedView.isUserInteractionEnabled = false
            if let tagModel = tagModel {
                bottomContentStackView.isHidden = false
                bottomTagComponent.update(tagModel)
            }
        case .shortAction:
            bottomContentStackView.isHidden = true
            roundedView.isUserInteractionEnabled = true
            if let tagModel = tagModel {
                topTagView.isHidden = false
                topTagComponent.update(tagModel)
            }
        }
    }

    private func setupSize(_ size: SystemOutlinedCardSize) {
        if size.width > .zero {
            roundedViewWidthConstraint.constant = size.width
            roundedViewWidthConstraint.isActive = true
        } else {
            roundedViewWidthConstraint.isActive = false
        }
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        action?(.tap)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? OutlinedCardModel else {
            return
        }

        let system = model.style.getSystem()
        self.system = system
        let size = system.sizes.getForSize(model.size)

        setupCardArrangement(system: system, style: model.style)
        setupFonts(system: system)
        setupSize(size)

        topTagView.isHidden = true
        bottomContentStackView.isHidden = true
        descriptionLabel.isHidden = true
        setupForStyle(model.style, tagModel: model.tagModel)

        titleLabel.text = model.title
        iconImage.image = Cosmos.iconSet(imageType: model.icon, size: .large)
        roundedView.layer.cornerRadius = system.metrics.cornerRadius
        roundedView.layer.borderWidth = system.metrics.strokeSize
    }

    func bindAction(_ action: ((OutlinedCardAction) -> Void)?) {
        self.action = action
    }
}
