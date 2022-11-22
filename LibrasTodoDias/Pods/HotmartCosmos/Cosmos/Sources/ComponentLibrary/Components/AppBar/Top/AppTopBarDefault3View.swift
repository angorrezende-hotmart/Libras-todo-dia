//
//  AppTopBarDefault3View.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 21/05/21.
//

import Foundation

final class AppTopBarDefault3View: ThemedCodedView, AppTopBarProtocol {
    // MARK: - Constants

    private enum Constants {
        static let barButtonSize: CGFloat = 36.0
        static let iconButtonSize: CGFloat = 36.0
        static let backButtonMinimumSize: CGFloat = 40.0
        static let animationInterval: TimeInterval = 0.1
    }

    // MARK: - Properties

    private var primaryColor: UIColor {
        Cosmos.colors.primaryBrandColor.color.color
    }

    private var primaryDarkerColor: UIColor {
        Cosmos.colors.primaryBrandColor.darker.color
    }

    private var viewModel: AppTopBarModel?
    private var action: ((AppTopBarAction) -> Void)?

    // MARK: - View Elements

    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill

        }.build()

        return stackView
    }()

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
        return view
    }()

    private let searchImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.image = UIImage(asset: Asset.searchMd)
        return view
    }()

    private lazy var searchTextField: UITextField = {
        let view = UITextField()
        view.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.leftView = searchImageView
        view.leftViewMode = .always
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.delegate = self

        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()

    private lazy var rightButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(rightButtonDidTouchUpInside(_:)), for: .touchUpInside)
        view.isHidden = true

        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return view
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        searchImageView.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        searchTextField.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral100.color
        searchTextField.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        searchTextField.font = Cosmos.typography.bodyStrong.text1Strong.font
        colorUIButton(backButton)
        colorUIButton(rightButton)
    }

    private func colorUIButton(_ button: UIButton) {
        button.tintColor = primaryColor
        button.setTitleColor(primaryColor, for: .normal)
        button.setTitleColor(primaryDarkerColor, for: .highlighted)
        button.titleLabel?.font = Cosmos.typography.body.text2.font
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(stackView)

        stackView.addArrangedSubview(iconButton)
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(rightButton)
    }

    override func constrainSubviews() {
        constrainIconButton()
        constraintBackButton()
        constrainSearchImageView()
        constraintStackView()
    }

    private func constrainIconButton() {
        iconButton.anchor(
            widthConstant: Constants.barButtonSize,
            heightConstant: Constants.barButtonSize
        )
    }

    private func constraintBackButton() {
        backButton.anchor(
            widthConstant: Constants.barButtonSize,
            heightConstant: Constants.barButtonSize
        )
    }

    private func constrainSearchImageView() {
        searchImageView.anchor(
            widthConstant: Constants.iconButtonSize
        )
    }

    private func constraintStackView() {
        stackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing1.value,
            leadingConstant: Spacing().spacing2.value,
            bottomConstant: Spacing().spacing1.value,
            trailingConstant: Spacing().spacing2.value
        )
    }

    // MARK: - Private Methods

    private func configurePlaceholderWithText(_ text: String) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .font: Cosmos.typography.body.text1.font,
                .foregroundColor: Cosmos.colors.productColors.neutralProductColor.neutral500.color,
            ]
        )

        searchTextField.attributedPlaceholder = attributedString
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        action?(.searchTextDidChange(string: textField.text))
    }

    @objc
    private func iconButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.logoTap)
    }

    @objc
    private func backButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.backButtonTap)
    }

    @objc
    private func rightButtonDidTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: Constants.animationInterval) {
            self.searchTextField.text = nil
            self.rightButton.isHidden = true
            self.iconButton.isHidden = self.shoudlHideIcon()
            self.backButton.isHidden = self.shouldHideBackButton()
        }
        searchTextField.endEditing(true)
        action?(.cancelSearchButtonTap)
    }

    private func shoudlHideIcon() -> Bool {
        !(viewModel?.showIcon ?? false)
    }

    private func shouldHideBackButton() -> Bool {
        switch viewModel?.style {
        case let .default3(showBackButton, _, _):
            return !showBackButton
        default:
            return true
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AppTopBarModel else {
            return
        }

        self.viewModel = model

        iconButton.isHidden = shoudlHideIcon()

        if shoudlHideIcon(), let customLeftIcon = model.customLeftIcon {
            iconButton.setImage(Cosmos.iconSet(imageType: customLeftIcon, size: .large), for: .normal)
            iconButton.imageView?.tintColor = model.customLeftIconTintColor?().color
        }

        switch model.style {
        case let .default3(_, placeholder, cancelButton):
            backButton.isHidden = shouldHideBackButton()
            configurePlaceholderWithText(placeholder)
            rightButton.setTitle(cancelButton, for: .normal)
        default:
            preconditionFailure("This style is not correspondent to his view")
        }
    }

    func bindAction(_ externalAction: ((AppTopBarAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}

// MARK: - UITextFieldDelegate

extension AppTopBarDefault3View: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: Constants.animationInterval) {
            self.iconButton.isHidden = true
            self.backButton.isHidden = true
            self.rightButton.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: Constants.animationInterval) {
            self.iconButton.isHidden = self.shoudlHideIcon()
            self.backButton.isHidden = self.shouldHideBackButton()
            self.rightButton.isHidden = true
        }
    }
}
