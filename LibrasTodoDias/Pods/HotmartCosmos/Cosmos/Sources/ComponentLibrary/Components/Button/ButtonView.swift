//
//  ButtonView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import Foundation
import UIKit

final class ButtonView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private lazy var button: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        view.layer.borderWidth = 1.0
        view.clipsToBounds = true
        return view
    }()

    private lazy var spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .white
        view.startAnimating()
        return view
    }()

    // MARK: - Dependencies

    let systemBorderRadius: SystemBorderRadius

    var customBorderRadius: CGFloat {
        let defaultRadius = BorderRadiusGroup().small.value
        guard let model = viewModel else { return defaultRadius }
        switch model.size {
        case .medium:
            return 20.0
        case .small:
            return 14.0
        }
    }

    // MARK: - Properties

    private var viewModel: ButtonModel?
    private var action: ((ButtonAction) -> Void)?
    private var system: SystemButton?

    // MARK: - Initialization

    init(
        systemBorderRadius: SystemBorderRadius = BorderRadiusGroup().small
    ) {
        self.systemBorderRadius = systemBorderRadius
        super.init(frame: .zero)
        configureView()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system, let model = viewModel else { return }

        configureActivityIndicatorColor(style: model.style, state: model.state)
        configureColor(system.color)

        switch model.state {
        case .disabled:
            configureColor(system.disabledColor)
        case .loading:
            button.setTitleColor(.clear, for: .normal)
            button.imageView?.tintColor = .clear
        default:
            break
        }
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(button)
        addSubview(spinner)
    }

    override func constrainSubviews() {
        button.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )

        spinner.anchor(
            top: centerYAnchor,
            leading: centerXAnchor,
            bottom: centerYAnchor,
            trailing: centerXAnchor
        )
    }

    // MARK: - Private Methods

    private func configureView() {
        button.layer.cornerRadius = systemBorderRadius.value
    }

    private func configureColor(
        _ buttonColor: SystemButtonColor
    ) {
        button.backgroundColor = buttonColor.background.color
        button.setTitleColor(viewModel?.textColor?() ?? buttonColor.text.color, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.imageView?.tintColor = viewModel?.textColor?() ?? buttonColor.text.color
        button.layer.borderColor = buttonColor.border?.color.cgColor ?? UIColor.clear.cgColor
    }

    @objc
    private func buttonDidTouchUpInside() {
        action?(.tap(model: viewModel))
    }

    private func resetButton() {
        configureView()
        button.layer.borderColor = UIColor.clear.cgColor
        button.imageEdgeInsets = .zero
        button.semanticContentAttribute = .forceLeftToRight
    }

    private func getContentEdgeInset(
        iconStyle: ButtonModel.IconStyle,
        size: ButtonModel.Size
    ) -> (title: UIEdgeInsets, content: UIEdgeInsets) {
        var leftTitleSpacing: CGFloat = .zero
        var rightTitleSpacing: CGFloat = .zero
        var leftContentSpacing: CGFloat = .zero
        var rightContentSpacing: CGFloat = .zero

        let verticalSpacing: CGFloat = size == .small ? 5.5 : 9.0
        let sideWithoutIconSpacing: CGFloat = size == .small ? 12.0 : 16.0
        let sideWithIconSpacing: CGFloat = size == .small ? 14 : 18.0
        let spacingBetweenTextAndIcon: CGFloat = 12.0

        switch iconStyle {
        case .without:
            leftContentSpacing = sideWithoutIconSpacing
            rightContentSpacing = sideWithoutIconSpacing
        case .left:
            leftTitleSpacing = spacingBetweenTextAndIcon
            rightTitleSpacing = -spacingBetweenTextAndIcon
            leftContentSpacing = sideWithIconSpacing
            rightContentSpacing = sideWithoutIconSpacing + leftTitleSpacing
        case .right:
            leftTitleSpacing = -spacingBetweenTextAndIcon
            rightTitleSpacing = spacingBetweenTextAndIcon
            leftContentSpacing = sideWithoutIconSpacing + rightTitleSpacing
            rightContentSpacing = sideWithIconSpacing
        case .only:
            leftContentSpacing = size == .small ? 6 : 10
            rightContentSpacing = size == .small ? 6 : 10
        }

        let titleEdgesInset: UIEdgeInsets = .init(
            top: .zero,
            left: leftTitleSpacing,
            bottom: .zero,
            right: rightTitleSpacing
        )

        let contentEdgeInset: UIEdgeInsets = .init(
            top: verticalSpacing,
            left: leftContentSpacing,
            bottom: verticalSpacing,
            right: rightContentSpacing
        )

        return (title: titleEdgesInset, content: contentEdgeInset)
    }

    private func configureActivityIndicatorColor(style: ButtonModel.Style, state: ButtonModel.State) {
        guard state != .disabled else {
            spinner.style = .gray
            return
        }

        let indicatorStyle: UIActivityIndicatorView.Style

        switch style {
        case .primary, .cta, .danger, .custom:
            indicatorStyle = .white
        case .default, .secondary, .tertiary:
            indicatorStyle = .gray
        }

        spinner.style = indicatorStyle
    }

    private func setupForState(_ state: ButtonModel.State) {
        let isUserInteractionEnabled: Bool
        let isSpinnerShowing: Bool

        switch state {
        case .normal:
            isUserInteractionEnabled = true
            isSpinnerShowing = false
        case .disabled:
            isUserInteractionEnabled = false
            isSpinnerShowing = false
        case .loading:
            isUserInteractionEnabled = false
            isSpinnerShowing = true
        case .highlighted:
            isUserInteractionEnabled = true
            isSpinnerShowing = false
            button.titleLabel?.font = button.titleLabel?.font.withTraits(traits: .traitBold)
        }

        button.isUserInteractionEnabled = isUserInteractionEnabled
        spinner.isHidden = !isSpinnerShowing
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ButtonModel else {
            return
        }

        resetButton()

        self.viewModel = model

        button.accessibilityIdentifier = model.accessibility?.componentIdentifier

        button.setTitle(model.title, for: .normal)

        let systemButton = model.getSystemButton()

        system = systemButton

        configurateColors()

        let font: UIFont
        let image: UIImage?

        switch model.size {
        case .medium:
            font = systemButton.typography.medium.font
        case .small:
            font = systemButton.typography.small.font
        }

        let insets = getContentEdgeInset(iconStyle: model.icon, size: model.size)
        button.titleEdgeInsets = insets.title
        button.contentEdgeInsets = insets.content

        switch (model.icon, model.size) {
        case (.without, .small):
            image = nil
        case (.without, .medium):
            image = nil
        case let (.left(icon), .small):
            image = Cosmos.iconSet(imageType: icon, size: .small)
        case let (.left(icon), .medium):
            image = Cosmos.iconSet(imageType: icon, size: .medium)
        case let (.right(icon), .small):
            image = Cosmos.iconSet(imageType: icon, size: .small)
            button.semanticContentAttribute = .forceRightToLeft
        case let (.right(icon), .medium):
            image = Cosmos.iconSet(imageType: icon, size: .medium)
            button.semanticContentAttribute = .forceRightToLeft
        case let (.only(icon), .small):
            image = Cosmos.iconSet(imageType: icon, size: .small)
            button.layer.cornerRadius = customBorderRadius
            button.contentMode = .center
            button.setTitle(nil, for: .normal)
        case let (.only(icon), .medium):
            image = Cosmos.iconSet(imageType: icon, size: .medium)
            button.layer.cornerRadius = customBorderRadius
            button.contentMode = .center
            button.setTitle(nil, for: .normal)
        }

        button.setImage(image, for: .normal)
        button.titleLabel?.font = font

        setupForState(model.state)
    }

    func bindAction(_ externalAction: ((ButtonAction) -> Void)?) {
        action = { buttonAction in
            externalAction?(buttonAction)
        }
    }
}
