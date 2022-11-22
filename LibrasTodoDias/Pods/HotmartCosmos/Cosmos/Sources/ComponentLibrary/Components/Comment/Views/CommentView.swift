//
//  CommentView.swift
//  HotmartCosmos
//
//  Created by Gabriel Lopes Ferreira on 08/06/22.
//

import Foundation
import UIKit

final class CommentView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        enum Avatar {
            static let normalHorizontalSpacing: CGFloat = 18.0
            static let replyHorizontalSpacing: CGFloat = 42.0
        }

        static let titleWidth: CGFloat = 100.0
        static let leftTopButtonModel: ButtonModel = .init(
            title: .empty,
            style: .tertiary,
            icon: .only(icon: .overflow),
            size: .small,
            accessibility: nil,
            textColor: { Cosmos.colors.productColors.neutralProductColor.neutral500.color }
        )

        enum Opacity {
            static let loading: Float = 0.4
            static let error: Float = 0.4
            static let `default`: Float = 1
        }

        static let textShortLength: Int = 130
    }

    // MARK: - Cosmos Components

    private let avatarComponent: Component<AvatarModel, AvatarAction> = Cosmos.makeAvatar()
    private let firstButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()
    private let secondButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()
    private let thirdButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()
    private let leftTopButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    // MARK: - View Elements

    private lazy var avatarView: UIView = avatarComponent.view()

    private let contentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing1.value
            $0.distribution = .fill
            $0.alignment = .leading
        }.build()

        return stackView
    }()

    private let titleContainerView = UIView()
    private let titleSubtitleStackview: UIStackView = {
        let stackview = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }.build()

        return stackview
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        label.font = Cosmos.typography.bodyStrong.text1Strong.font
        return label
    }()

    private let dividerLabel: UILabel = {
        let label = UILabel()
        label.textColor = Cosmos.colors.productColors.neutralProductColor.neutral400.color
        label.font = Cosmos.typography.body.text1.font
        label.text = "—"
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        label.font = Cosmos.typography.body.text1.font
        return label
    }()

    private lazy var retryButton: UIButton = {
        let button = UIButton()
        button.setImage(Cosmos.iconSet(imageType: .reload, size: .small), for: .normal)
        button.tintColor = Cosmos.colors.productColors.redProductColor.color.color
        button.addTarget(self, action: #selector(onTapRetryButton), for: .touchUpInside)
        button.isHidden = true
        return button
    }()

    private lazy var leftTopButtonView: UIView = leftTopButtonComponent.view()

    private let ratingComponent = RatingComponent()

    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.body.text2.font
        view.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        view.numberOfLines = .zero
        view.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapText))
        addGestureRecognizer(tapGestureRecognizer)
        return view
    }()

    private let buttonsContainer = UIView()
    private lazy var firstButtonView = firstButtonComponent.view()
    private lazy var secondButtonView = secondButtonComponent.view()
    private lazy var thirdButtonView = thirdButtonComponent.view()
    private lazy var showRepliesButton: UIButton = {
        let showRepliesButton = UIButton()
        showRepliesButton.setTitleColor(Cosmos.colors.productColors.neutralProductColor.neutral600.color, for: .normal)
        showRepliesButton.addTarget(self, action: #selector(actionRepliesButton), for: .touchUpInside)
        showRepliesButton.titleLabel?.font = Cosmos.typography.body.text1.font
        return showRepliesButton
    }()

    // MARK: - Variables

    private var viewModel: CommentModel?
    private var action: ((CommentAction) -> Void)?
    private var textColor: UIColor?
    private var subtitleColor: UIColor?
    private var avatarLeadingConstraint: NSLayoutConstraint?

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(avatarView)
        addSubview(contentStackView)
        titleContainerView.addSubview(titleSubtitleStackview)
        titleContainerView.addSubview(leftTopButtonView)
        buttonsContainer.addSubview(firstButtonView)
        buttonsContainer.addSubview(secondButtonView)
        buttonsContainer.addSubview(thirdButtonView)

        contentStackView.addArrangedSubviews([
            titleContainerView,
            ratingComponent,
            textLabel,
            buttonsContainer,
            showRepliesButton,
        ])

        titleSubtitleStackview.addArrangedSubviews([
            titleLabel,
            dividerLabel,
            subtitleLabel,
            retryButton,
        ])
    }

    override func constrainSubviews() {
        constrainAvatarView()
        constrainTitleContainer()
        constrainTitleSubtitleStackview()
        constrainTitleLabel()
        constrainLeftTopButton()
        constrainStackView()
        constrainActionsContainer()
    }

    override func configurateColors() {
        titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        textLabel.textColor = textColor
        subtitleLabel.textColor = subtitleColor
        setupBackgroundColor()
    }

    // MARK: - Constrain Methods

    private func constrainAvatarView() {
        avatarView.anchor(
            top: topAnchor,
            topConstant: Spacing().spacing4.value
        )

        avatarLeadingConstraint = avatarView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: Constants.Avatar.normalHorizontalSpacing
        )

        avatarLeadingConstraint?.isActive = true
    }

    private func constrainTitleContainer() {
        titleContainerView.widthAnchor.constraint(
            equalTo: contentStackView.widthAnchor
        ).isActive = true
    }

    private func constrainTitleSubtitleStackview() {
        titleSubtitleStackview.anchor(
            top: titleContainerView.topAnchor,
            leading: titleContainerView.leadingAnchor,
            bottom: titleContainerView.bottomAnchor
        )

        titleSubtitleStackview.trailingAnchor.constraint(
            lessThanOrEqualTo: leftTopButtonView.leadingAnchor,
            constant: -Spacing().spacing2.value
        ).isActive = true
    }

    private func constrainTitleLabel() {
        titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.titleWidth).isActive = true
    }

    private func constrainLeftTopButton() {
        leftTopButtonView.anchor(
            top: titleContainerView.topAnchor,
            bottom: titleContainerView.bottomAnchor,
            trailing: titleContainerView.trailingAnchor
        )
    }

    private func constrainStackView() {
        contentStackView.anchor(
            top: topAnchor,
            leading: avatarView.trailingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing4.value,
            leadingConstant: Spacing().spacing4.value,
            bottomConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )
    }

    private func constrainActionsContainer() {
        buttonsContainer.widthAnchor.constraint(equalTo: contentStackView.widthAnchor).isActive = true
        firstButtonView.anchor(
            top: buttonsContainer.topAnchor,
            leading: buttonsContainer.leadingAnchor,
            bottom: buttonsContainer.bottomAnchor
        )

        secondButtonView.anchor(
            top: buttonsContainer.topAnchor,
            leading: firstButtonView.trailingAnchor,
            bottom: buttonsContainer.bottomAnchor,
            leadingConstant: Spacing().spacing6.value
        )

        thirdButtonView.anchor(
            top: buttonsContainer.topAnchor,
            bottom: buttonsContainer.bottomAnchor,
            trailing: buttonsContainer.trailingAnchor,
            trailingConstant: .zero
        )
    }

    @objc private func onTapRetryButton() {
        action?(.retryTap)
    }

    // MARK: - Private Methods

    @objc private func onTapText() {
        action?(.textTap)
    }

    private func setupTitle(_ viewModel: CommentModel) {
        titleLabel.text = viewModel.authorName
        subtitleLabel.text = viewModel.subtitle
    }

    private func setupButtons(_ firstButtonModel: ButtonModel, _ secondButtonModel: ButtonModel?, _ thirdButtonModel: ButtonModel?) {
        firstButtonComponent.update(firstButtonModel)
        if let secondButtonModel = secondButtonModel {
            secondButtonComponent.update(secondButtonModel)
        } else {
            secondButtonView.isHidden = true
        }
        if let thirdButtonModel = thirdButtonModel {
            thirdButtonComponent.update(thirdButtonModel)
        } else {
            thirdButtonView.isHidden = true
        }
    }

    private func setupStyle(_ style: CommentModel.Style) {
        switch style {
        case .base:
            ratingComponent.isHidden = true
            buttonsContainer.isHidden = true
        case let .baseActions(firstButtonModel, secondButtonModel, thirdButtonModel):
            ratingComponent.isHidden = true
            buttonsContainer.isHidden = false
            setupButtons(firstButtonModel, secondButtonModel, thirdButtonModel)
        case .baseRating(let rating):
            ratingComponent.isHidden = false
            buttonsContainer.isHidden = true
            ratingComponent.bind(.init(rating: rating))
        }
    }

    private func setupState(_ state: CommentModel.State) {
        var opacity: Float

        switch state {
        case .`default`:
            opacity = Constants.Opacity.`default`
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
            textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        case .loading:
            opacity = Constants.Opacity.loading
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
            textColor = Cosmos.colors.productColors.neutralProductColor.neutral400.color
        case .error:
            opacity = Constants.Opacity.error
            subtitleColor = Cosmos.colors.productColors.redProductColor.color.color
            textColor = Cosmos.colors.productColors.neutralProductColor.neutral400.color
        }

        textLabel.textColor = textColor
        subtitleLabel.textColor = subtitleColor
        avatarView.layer.opacity = opacity
        buttonsContainer.layer.opacity = opacity
        retryButton.isHidden = state != .error
    }

    private func setupRepliesButton(_ repliesButtonModel: ButtonModel?) {
        showRepliesButton.isHidden = repliesButtonModel == nil
        if let repliesButtonModel = repliesButtonModel {
            showRepliesButton.setTitle(repliesButtonModel.title, for: .normal)
            let titleString = NSMutableAttributedString(string: repliesButtonModel.title)
            titleString.addAttribute(
                NSAttributedString.Key.underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: repliesButtonModel.title.count)
            )
            showRepliesButton.setAttributedTitle(titleString, for: .normal)
        }
    }

    private func setupText() {
        guard let viewModel = viewModel else {
            return
        }

        var string: String = viewModel.text

        if !viewModel.isTextExpanded, string.count > Constants.textShortLength, let viewMore = viewModel.viewMoreText {
            string = string
                .trunc(Constants.textShortLength)
                .appending(viewMore)
        }

        let font = Cosmos.typography.body.text2.font
        let textColor = textColor ?? Cosmos.colors.productColors.neutralProductColor.neutral900.color
        let attributedString =
            NSMutableAttributedString(
                string: string,
                attributes: [.font: font, .foregroundColor: textColor]
            )
        if !viewModel.isTextExpanded, string.count > Constants.textShortLength, let viewMore = viewModel.viewMoreText {
            attributedString.addAttributes([
                .font: Cosmos.typography.bodyStrong.text2Strong.font,
                .foregroundColor: textColor,
            ], range: NSRange(
                location: Constants.textShortLength + 3,
                length: viewMore.count
            ))
        }

        textLabel.attributedText = attributedString
    }

    private func setupBackgroundColor() {
        guard let viewModel = viewModel else {
            return
        }

        backgroundColor = viewModel.isSelected ? Cosmos.colors.productColors.neutralProductColor.neutral100.color : Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
    }

    private func setupAvatarSpacing() {
        guard let viewModel = viewModel else {
            return
        }
        avatarLeadingConstraint?.isActive = false
        avatarLeadingConstraint?.constant = viewModel.isReplyComment ? Constants.Avatar.replyHorizontalSpacing : Constants.Avatar.normalHorizontalSpacing
        avatarLeadingConstraint?.isActive = true
    }

    @objc private func actionRepliesButton() {
        action?(.showRepliesTap)
    }

    // MARK: - Public

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let viewModel = viewModel as? CommentModel else {
            return
        }

        self.viewModel = viewModel

        setupTitle(viewModel)

        avatarComponent.update(
            .init(
                content: viewModel.avatarImage,
                size: viewModel.isReplyComment ? .xxs : .sm,
                style: .circle
            )
        )

        leftTopButtonView.isHidden = !viewModel.showLeftTopButton
        leftTopButtonComponent.update(Constants.leftTopButtonModel)

        setupText()
        setupStyle(viewModel.style)
        setupState(viewModel.state)
        setupRepliesButton(viewModel.repliesButtonModel)
        setupBackgroundColor()
        setupAvatarSpacing()
    }

    func bindAction(_ action: ((CommentAction) -> Void)?) {
        self.action = action

        firstButtonComponent.onEvent? { [weak self] _ in
            self?.action?(.firstButtonTap)
        }

        secondButtonComponent.onEvent? { [weak self] _ in
            self?.action?(.secondButtonTap)
        }

        leftTopButtonComponent.onEvent? { [weak self] _ in
            self?.action?(.leftTopButtonTap)
        }
    }
}
