//
//  AppTobBarDefault1View.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 20/05/21.
//

import Foundation

final class AppTobBarDefault1View: ThemedCodedView, AppTopBarProtocol {
    // MARK: - Constants

    private enum Constants {
        static let height: CGFloat = 44.0
        static let barButtonSize: CGFloat = 36.0
        static let badgeSize: CGFloat = 10.0
        static let backButtonMinimumSize: CGFloat = 40.0
        static let badgeConstant: CGFloat = 2.0
    }

    // MARK: - Properties

    private var primaryColor: SystemColor {
        Cosmos.colors.primaryBrandColor.color
    }

    private var primaryDarkerColor: SystemColor {
        Cosmos.colors.primaryBrandColor.darker
    }

    private var model: AppTopBarModel?
    private var action: ((AppTopBarAction) -> Void)?

    private var buttonTintColor: SystemColor?
    private var titleColor: SystemColor?

    private lazy var buttonIndex: [UIButton: Int] = [
        firstButton: 0,
        secondButton: 1,
        thirdButton: 2,
    ]

    private var avatarModel: AvatarModel = .init(
        content: .none,
        size: .xs,
        style: .circle
    )

    // MARK: - View Elements

    private lazy var iconButton: UIButton = {
        let view = UIButton()
        view.adjustsImageWhenHighlighted = false
        view.setImage(Cosmos.logoSymbols.symbol.image, for: .normal)
        view.addTarget(self, action: #selector(iconButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private let rightButtonStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill

        }.build()

        return stackView
    }()

    private let firstBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Constants.badgeSize / 2
        view.isHidden = true
        return view
    }()

    private let secondBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Constants.badgeSize / 2
        view.isHidden = true
        return view
    }()

    private let thirdBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Constants.badgeSize / 2
        view.isHidden = true
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

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()

    private lazy var rightButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(rightButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var firstButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .config, size: .medium), for: .normal)
        view.addTarget(self, action: #selector(barButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var secondButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .config, size: .medium), for: .normal)
        view.addTarget(self, action: #selector(barButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var thirdButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .config, size: .medium), for: .normal)
        view.addTarget(self, action: #selector(barButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var avatarComponent: Component<AvatarModel, AvatarAction> = {
        let avatar = Cosmos.makeAvatar()
        avatar.update(avatarModel)
        avatar.onEvent? { [weak self] _ in
            self?.action?(.avatarTap)
        }
        return avatar
    }()

    private lazy var selectorButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .expandMore, size: .small), for: .normal)
        view.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        view.addTarget(self, action: #selector(selectorButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        let titleSystemColor = titleColor ?? Cosmos.colors.productColors.neutralProductColor.neutral900

        titleLabel.textColor = Cosmos.getUIColorBy(systemColor: titleSystemColor)
        colorUIButton(backButton)
        colorUIButton(rightButton)
        rightButtonStackView.arrangedSubviews.forEach {
            guard let uiButton = $0 as? UIButton else { return }
            colorUIButton(uiButton)
        }
    }

    private func colorUIButton(_ button: UIButton) {
        let buttonSystemColor = buttonTintColor ?? primaryColor

        let color = Cosmos.getUIColorBy(systemColor: buttonSystemColor)
        button.tintColor = color
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(color, for: .highlighted)
        button.titleLabel?.font = Cosmos.typography.body.text2.font
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(iconButton)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(selectorButton)
        addSubview(rightButton)
        addSubview(rightButtonStackView)

        firstButton.addSubview(firstBadgeView)
        secondButton.addSubview(secondBadgeView)
        thirdButton.addSubview(thirdBadgeView)

        rightButtonStackView.addArrangedSubview(firstButton)
        rightButtonStackView.addArrangedSubview(secondButton)
        rightButtonStackView.addArrangedSubview(thirdButton)
        rightButtonStackView.addArrangedSubview(avatarComponent.view())
    }

    private func configureBadge(hasBadge: Bool) {
        if !firstButton.isHidden, secondButton.isHidden, thirdButton.isHidden {
            firstBadgeView.isHidden = hasBadge
        } else if !firstButton.isHidden, !secondButton.isHidden, thirdButton.isHidden {
            secondBadgeView.isHidden = hasBadge
        } else if !firstButton.isHidden, !secondButton.isHidden, !thirdButton.isHidden {
            thirdBadgeView.isHidden = hasBadge
        }
    }

    private func configureSelector(_ hasSelector: Bool, title: String) {
        if hasSelector {
            setTitleKerning(title)
            linkSelectorActionToTitle()
        } else {
            selectorButton.isHidden = true
        }

        constraintTitleLabel(enableLeftAlignment: hasSelector)
    }

    override func constrainSubviews() {
        anchor(heightConstant: Constants.height)
        constrainIconButton()
        constraintBackButton()
        constrainRightButton()
        constrainRightButton(firstButton)
        constrainRightButton(secondButton)
        constrainRightButton(thirdButton)
        constrainBadgeView()
        constraintRightButtonStackView()
        constrainSelector()
    }

    private func constrainIconButton() {
        iconButton.anchor(
            leading: leadingAnchor,
            leadingConstant: Spacing().spacing2.value,
            widthConstant: Constants.barButtonSize,
            heightConstant: Constants.barButtonSize
        )
        iconButton.anchorCenterYToSuperview()
    }

    private func constraintTitleLabel(enableLeftAlignment: Bool = false) {
        if enableLeftAlignment {
            titleLabel.anchorCenterYToSuperview()
            titleLabel.anchor(
                leading: backButton.trailingAnchor,
                leadingConstant: Spacing().spacing3.value
            )
        } else {
            titleLabel.anchorCenterSuperview()
            titleLabel.layout(using: [
                titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor),
                titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: rightButtonStackView.leadingAnchor),
            ])
        }
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

    private func constrainBadgeView() {
        firstBadgeView.anchor(
            top: firstButton.topAnchor,
            trailing: firstButton.trailingAnchor,
            topConstant: Constants.badgeConstant,
            trailingConstant: Constants.badgeConstant,
            widthConstant: Constants.badgeSize,
            heightConstant: Constants.badgeSize
        )

        secondBadgeView.anchor(
            top: secondButton.topAnchor,
            trailing: secondButton.trailingAnchor,
            topConstant: Constants.badgeConstant,
            trailingConstant: Constants.badgeConstant,
            widthConstant: Constants.badgeSize,
            heightConstant: Constants.badgeSize
        )

        thirdBadgeView.anchor(
            top: thirdButton.topAnchor,
            trailing: thirdButton.trailingAnchor,
            topConstant: Constants.badgeConstant,
            trailingConstant: Constants.badgeConstant,
            widthConstant: Constants.badgeSize,
            heightConstant: Constants.badgeSize
        )
    }

    private func constrainRightButton() {
        rightButton.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            trailingConstant: Spacing().spacing2.value
        )
    }

    private func constraintRightButtonStackView() {
        rightButtonStackView.anchor(
            trailing: trailingAnchor,
            trailingConstant: Spacing().spacing2.value
        )

        rightButtonStackView.anchorCenterYToSuperview()
    }

    private func constrainRightButton(_ button: UIButton) {
        button.anchor(widthConstant: Constants.barButtonSize)
    }

    private func constrainSelector() {
        selectorButton.anchorCenterYToSuperview()
        selectorButton.anchor(
            leading: titleLabel.trailingAnchor,
            leadingConstant: Spacing().spacing2.value
        )
    }

    // MARK: - Private Methods

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
        action?(.rightButtonTap)
    }

    @objc
    private func barButtonDidTouchUpInside(_ sender: UIButton) {
        let index = buttonIndex[sender] ?? -1
        action?(.barButtonTap(index: index))
    }

    @objc
    private func selectorButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.selectorButtonTap)
    }

    private func configureButtonForContextMenuIfNeeded() {
        if #available(iOS 14.0, *),
           let menu = model?.menu,
           let button = buttonIndex.first(where: { $0.value == menu.buttonIndex })?.key {
            configureButtonForMenu(button, menu: menu)
        }
    }

    @available(iOS 14.0, *)
    private func configureButtonForMenu(_ button: UIButton, menu: AppTopBarModel.Menu) {
        let menuItems: [UIAction] = menu.options.map { option in
            .init(title: option.title, image: Cosmos.iconSet(imageType: option.icon, size: .medium)) { _ in option.action() }
        }

        let menu = UIMenu(options: .displayInline, children: menuItems)
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
    }

    private func setTitleKerning(_ title: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        titleLabel.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.kern: 3.6, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    private func linkSelectorActionToTitle() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectorButtonDidTouchUpInside(_:)))
        titleLabel.addGestureRecognizer(tapGesture)
        titleLabel.isUserInteractionEnabled = true
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AppTopBarModel else {
            return
        }

        self.model = model

        iconButton.isHidden = !model.showIcon
        backButton.isHidden = model.showIcon

        if model.showIcon, let customLeftIcon = model.customLeftIcon {
            iconButton.setImage(Cosmos.iconSet(imageType: customLeftIcon, size: .large), for: .normal)
            iconButton.imageView?.tintColor = model.customLeftIconTintColor?().color
        }

        titleLabel.font = model.titleCustomFont?.font ?? Cosmos.typography.bodyStrong.text2Strong.font

        switch model.style {
        case let .default1(title, backButtonText, rightButtonText, tintColor, hasSelector):

            titleLabel.text = title
            backButton.setTitle(backButtonText, for: .normal)

            rightButton.setTitle(rightButtonText, for: .normal)
            rightButton.isHidden = rightButtonText == nil

            if let tintColor = tintColor?() {
                buttonTintColor = tintColor
            }

            rightButtonStackView.isHidden = true
            avatarComponent.view().isHidden = true
            firstButton.isHidden = true
            secondButton.isHidden = true
            thirdButton.isHidden = true

            configureSelector(hasSelector, title: title ?? "")
        case let .default1MultipleButtons(title, backButtonText, avatarContent, firstButtonImage, secondButtonImage, thirdButtonImage, tintColor, hasBadge, hasSelector):

            titleLabel.text = title
            iconButton.isHidden = backButtonText != nil

            backButton.setTitle(backButtonText, for: .normal)

            if let avatarContent = avatarContent {
                avatarModel.content = avatarContent
                avatarComponent.update(avatarModel)
                avatarComponent.view().isHidden = false
            } else {
                avatarComponent.view().isHidden = true
            }

            rightButton.isHidden = true

            rightButtonStackView.isHidden = false

            firstButton.setImage(firstButtonImage, for: .normal)
            firstButton.isHidden = firstButtonImage == nil
            secondButton.setImage(secondButtonImage, for: .normal)
            secondButton.isHidden = secondButtonImage == nil
            thirdButton.setImage(thirdButtonImage, for: .normal)
            thirdButton.isHidden = thirdButtonImage == nil

            if let tintColor = tintColor?() {
                buttonTintColor = tintColor
            }

            configureBadge(hasBadge: !hasBadge)
            configureSelector(hasSelector, title: title ?? "")
        case let .default1MultipleIcons(title, backButtonText, avatarContent, firstIcon, secondIcon, thirdIcon, tintColor, titleColor, hasBadge, hasSelector):

            titleLabel.text = title
            iconButton.isHidden = backButtonText != nil

            self.titleColor = titleColor?()
            buttonTintColor = tintColor()

            backButton.setTitle(backButtonText, for: .normal)

            if let avatarContent = avatarContent {
                avatarModel.content = avatarContent
                avatarComponent.update(avatarModel)
                avatarComponent.view().isHidden = false
            } else {
                avatarComponent.view().isHidden = true
            }

            rightButton.isHidden = true

            rightButtonStackView.isHidden = false

            if let icon = firstIcon {
                let iconSet = Cosmos.iconSet(imageType: icon, size: .medium)
                firstButton.tintColor = tintColor().color
                firstButton.setImage(iconSet, for: .normal)
            }
            firstButton.isHidden = firstIcon == nil

            if let icon = secondIcon {
                let iconSet = Cosmos.iconSet(imageType: icon, size: .medium)
                secondButton.tintColor = tintColor().color
                secondButton.setImage(iconSet, for: .normal)
            }
            secondButton.isHidden = secondIcon == nil

            if let icon = thirdIcon {
                let iconSet = Cosmos.iconSet(imageType: icon, size: .medium)
                thirdButton.tintColor = tintColor().color
                thirdButton.setImage(iconSet, for: .normal)
            }
            thirdButton.isHidden = thirdIcon == nil

            configureBadge(hasBadge: !hasBadge)
            configureSelector(hasSelector, title: title ?? "")
        default:
            assertionFailure("This style is not correspondent to his view")
        }

        configurateColors()
        configureButtonForContextMenuIfNeeded()
    }

    func bindAction(_ externalAction: ((AppTopBarAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
