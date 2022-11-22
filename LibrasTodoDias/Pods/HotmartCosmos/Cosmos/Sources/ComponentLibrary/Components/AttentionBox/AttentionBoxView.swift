//
//  AttentionBoxView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 14/07/21.
//

import Foundation

final class AttentionBoxView: ThemedCodedView, Bindable {
    // MARK: - Cosmos Components

    private let buttonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    // MARK: - View Components

    private let textAndButtonStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let textAndIconStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing4.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let textStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = .zero
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = .zero
        return view
    }()

    private let iconView: UIView = {
        let view = UIView()
        return view
    }()

    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    private let buttonView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var buttonComponentView: UIView = {
        let view = buttonComponent.view()
        return view
    }()

    // MARK: - Private Properties

    private var action: ((AttentionBoxAction) -> Void)?
    private var system: SystemAttentionBox?
    private var model: AttentionBoxModel?

    // MARK: - Inititalization

    init() {
        super.init(frame: .zero)
        configureView()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let model = model, let system = system else { return }
        iconImageView.tintColor = system.color.icon.color
        subviews.forEach {
            $0.layoutSubviews()
        }
        titleLabel.textColor = system.color.title.color
        descriptionLabel.textColor = system.color.description.color
        backgroundColor = system.backgroundColor.color
        buttonComponent.update(system.buttonModel)

        switch model.renderStyle {
        case .html:
            descriptionLabel.renderAsHTML(model.description, with: system.typography.description.font, color: Cosmos.colors.productColors.neutralProductColor.neutral600)
        case .simple:
            descriptionLabel.text = model.description
            descriptionLabel.font = system.typography.description.font
            descriptionLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral600.color
        }
    }

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(textAndButtonStackView)

        textAndButtonStackView.addArrangedSubview(textAndIconStackView)
        textAndButtonStackView.addArrangedSubview(buttonView)
        buttonView.addSubview(buttonComponentView)

        textAndIconStackView.addArrangedSubview(iconView)
        textAndIconStackView.addArrangedSubview(textStackView)
        iconView.addSubview(iconImageView)

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
    }

    override func constrainSubviews() {
        constrainMainStackView()
        constrainIconImageView()
        constrainButtonView()
    }

    // MARK: - Constraint Methods

    private func constrainMainStackView() {
        textAndButtonStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing4.value,
            leadingConstant: Spacing().spacing4.value,
            bottomConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )
    }

    private func constrainIconImageView() {
        iconImageView.anchor(
            top: iconView.topAnchor,
            leading: iconView.leadingAnchor,
            trailing: iconView.trailingAnchor
        )
    }

    private func constrainButtonView() {
        buttonComponentView.anchor(
            top: buttonView.topAnchor,
            bottom: buttonView.bottomAnchor,
            trailing: buttonView.trailingAnchor
        )
    }

    // MARK: - Private Methods

    private func configureView() {
        layer.cornerRadius = BorderRadiusGroup().small.value
        clipsToBounds = true
    }

    private func configureButtonComponentFor(model: ButtonModel?) {
        guard let model = model else {
            return
        }

        buttonView.isHidden = false
        buttonComponent.update(model)

        let buttonAction: ((CosmosAction) -> Void) = { [weak self] _ in
            self?.action?(.didTapButton)
        }
        buttonComponent.onEvent?(buttonAction)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AttentionBoxModel else {
            return
        }

        let system = model.style.getSystem()

        self.model = model
        self.system = system

        configureView()
        configurateColors()

        titleLabel.isHidden = true
        if let title = model.title {
            titleLabel.isHidden = false
            titleLabel.text = title
            titleLabel.font = system.typography.title.font
        }

        buttonView.isHidden = true
        if let buttonTitle = model.buttonText {
            self.system?.buttonModel.title = buttonTitle
            configureButtonComponentFor(model: self.system?.buttonModel)
        }

        descriptionLabel.font = system.typography.description.font
        iconImageView.image = Cosmos.iconSet(imageType: model.icon, size: .medium)
    }

    func bindAction(_ externalAction: ((AttentionBoxAction) -> Void)?) {
        action = { attentionBoxAction in
            externalAction?(attentionBoxAction)
        }
    }
}
