//
//  AppTobBarDefault2View.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 21/05/21.
//

import Foundation

final class AppTobBarDefault2View: ThemedCodedView, AppTopBarProtocol {
    // MARK: - Constants

    private enum Constants {
        static let barButtonSize: CGFloat = 36.0
        static let backButtonMinimumSize: CGFloat = 40.0
    }

    // MARK: - Properties

    private var primaryColor: UIColor {
        Cosmos.colors.primaryBrandColor.color.color
    }

    private var primaryDarkerColor: UIColor {
        Cosmos.colors.primaryBrandColor.darker.color
    }

    private var action: ((AppTopBarAction) -> Void)?

    // MARK: - Cosmos Componentes

    private let buttonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private var buttonModel: ButtonModel = .init(
        title: String(),
        style: .primary,
        icon: .without,
        size: .small,
        accessibility: nil
    )

    // MARK: - View Elements

    private lazy var iconButton: UIButton = {
        let view = UIButton()
        view.adjustsImageWhenHighlighted = false
        view.setImage(Cosmos.logoSymbols.symbol.image, for: .normal)
        view.addTarget(self, action: #selector(iconButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .chevronLeft, size: .medium), for: .normal)
        view.centerTextAndImage(spacing: Spacing().spacing2.value)
        view.addTarget(self, action: #selector(backButtonDidTouchUpInside(_:)), for: .touchUpInside)
        view.contentHorizontalAlignment = .leading
        return view
    }()

    private lazy var rightButton: UIView = {
        let view = buttonComponent.view()
        buttonComponent.update(buttonModel)
        buttonComponent.onEvent? { [weak self] _ in
            self?.action?(.rightButtonTap)
        }
        return view
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backButton.titleLabel?.font = Cosmos.typography.body.text2.font
        colorUIButton(backButton)
    }

    private func colorUIButton(_ button: UIButton) {
        button.tintColor = primaryColor
        button.setTitleColor(primaryColor, for: .normal)
        button.setTitleColor(primaryDarkerColor, for: .highlighted)
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(iconButton)
        addSubview(backButton)
        addSubview(rightButton)
    }

    override func constrainSubviews() {
        constrainIconImageView()
        constraintBackButton()
        constrainRightButton()
    }

    private func constrainIconImageView() {
        iconButton.anchor(
            leading: leadingAnchor,
            leadingConstant: Spacing().spacing2.value,
            widthConstant: Constants.barButtonSize,
            heightConstant: Constants.barButtonSize
        )
        iconButton.anchorCenterYToSuperview()
    }

    private func constraintBackButton() {
        backButton.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            leadingConstant: Spacing().spacing2.value
        )

        backButton.layout(using: [
            backButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.backButtonMinimumSize),
        ])
    }

    private func constrainRightButton() {
        rightButton.anchor(
            trailing: trailingAnchor,
            trailingConstant: Spacing().spacing2.value
        )
        rightButton.anchorCenterYToSuperview()
    }

    // MARK: - Private Methods

    @objc
    private func backButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.backButtonTap)
    }

    @objc
    private func iconButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.logoTap)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AppTopBarModel else {
            return
        }

        iconButton.isHidden = !model.showIcon
        backButton.isHidden = model.showIcon

        if model.showIcon, let customLeftIcon = model.customLeftIcon {
            iconButton.setImage(Cosmos.iconSet(imageType: customLeftIcon, size: .large), for: .normal)
            iconButton.imageView?.tintColor = model.customLeftIconTintColor?().color
        }

        switch model.style {
        case let .default2(backButtonText, rightButtonText):
            backButton.setTitle(backButtonText, for: .normal)

            buttonModel.title = rightButtonText
            buttonComponent.update(buttonModel)
        default:
            assertionFailure("This style is not correspondent to his view")
        }
    }

    func bindAction(_ externalAction: ((AppTopBarAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
