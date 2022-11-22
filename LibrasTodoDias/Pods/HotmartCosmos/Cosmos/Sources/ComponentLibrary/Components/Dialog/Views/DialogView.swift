//
//  DialogView.swift
//  HotmartCosmos
//
//  Created by Ana Leticia Camargos Viana Lara on 04/11/21.
//

import Foundation
import UIKit

protocol DialogViewDelegate: AnyObject {
    func dialogViewDidDismiss(completion: (() -> Void)?)
}

final class DialogView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let backgroundAlpha: CGFloat = 0.6
    }

    // MARK: - View Elements

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.alpha = Constants.backgroundAlpha
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOutDialogView))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()

    private let dialogView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()

    private let contentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let avatarContentView: UIView = .init()

    private let thumbnailContentView: UIView = .init()

    private let avatar: Component<AvatarModel, AvatarAction> = Cosmos.makeAvatar()

    private let thumbnail: Component<ThumbnailModel, Void> = Cosmos.makeThumbnail()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.bodyStrong.text4Strong.font
        view.numberOfLines = .zero
        view.textAlignment = .center
        return view
    }()

    private let subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.body.text2.font
        view.numberOfLines = .zero
        view.textAlignment = .center
        return view
    }()

    private let firstButton: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private let secondButton: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    // MARK: - Internal Properties

    weak var delegate: DialogViewDelegate?

    // MARK: - Properties

    private var viewModel: DialogModel?
    private var action: ((DialogAction) -> Void)?

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        configureView()
    }

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(backgroundView)
        addSubview(dialogView)
        dialogView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(avatarContentView)
        contentStackView.addArrangedSubview(thumbnailContentView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(subtitleLabel)
        contentStackView.addArrangedSubview(firstButton.view())
        contentStackView.addArrangedSubview(secondButton.view())
        avatarContentView.addSubview(avatar.view())
        thumbnailContentView.addSubview(thumbnail.view())
    }

    override func constrainSubviews() {
        constrainBackgroundView()
        constrainDialogView()
        constrainContentStackView()
        constrainAvatar()
        constrainThumbnail()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dialogView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: BorderRadiusGroup().medium.value)
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let model = viewModel else { return }
        backgroundView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.black.color
        dialogView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        subtitleLabel.renderAsHTML(model.message, with: Cosmos.typography.body.text2.font, color: Cosmos.colors.productColors.neutralProductColor.neutral600, andTextAlignment: .center)
    }

    // MARK: - Constrain Methods

    private func constrainBackgroundView() {
        backgroundView.fillSuperview()
    }

    private func constrainDialogView() {
        dialogView.anchor(
            leading: leadingAnchor,
            trailing: trailingAnchor,
            leadingConstant: Spacing().spacing6.value,
            trailingConstant: Spacing().spacing6.value
        )

        dialogView.layout(using: [
            dialogView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func constrainContentStackView() {
        contentStackView.anchor(
            top: dialogView.topAnchor,
            leading: dialogView.leadingAnchor,
            bottom: dialogView.bottomAnchor,
            trailing: dialogView.trailingAnchor,
            topConstant: Spacing().spacing6.value,
            leadingConstant: Spacing().spacing6.value,
            bottomConstant: Spacing().spacing5.value,
            trailingConstant: Spacing().spacing5.value
        )

        contentStackView.setCustomSpacing(Spacing().spacing1.value, after: titleLabel)
        contentStackView.setCustomSpacing(Spacing().spacing6.value, after: subtitleLabel)
        contentStackView.setCustomSpacing(Spacing().spacing2.value, after: firstButton.view())
    }

    private func constrainAvatar() {
        let view = avatar.view()
        view.anchor(
            top: avatarContentView.topAnchor,
            bottom: avatarContentView.bottomAnchor,
            bottomConstant: Spacing().spacing3.value,
            heightConstant: Spacing().spacing9.value
        )
        view.anchorCenterXToSuperview()
    }

    private func constrainThumbnail() {
        let view = thumbnail.view()
        view.anchor(
            top: thumbnailContentView.topAnchor,
            bottom: thumbnailContentView.bottomAnchor,
            bottomConstant: Spacing().spacing3.value
        )
        view.anchorCenterXToSuperview()
    }

    // MARK: - Private Methods

    private func configureView() {
        firstButton.onEvent? { [weak self] _ in
            self?.close(completion: {
                self?.action?(.firstButtonTap)
            })
        }
        secondButton.onEvent? { [weak self] _ in
            self?.close(completion: {
                self?.action?(.secondButtonTap)
            })
        }
    }

    @objc private func handleTapOutDialogView() {
        close(completion: { [weak self] in
            self?.action?(.close)
        })
    }

    private func close(completion: (() -> Void)?) {
        delegate?.dialogViewDidDismiss(completion: completion)
    }

    private func bindButtomModels(firstButtomModel: ButtonModel, secondButtonModel: ButtonModel?) {
        firstButton.update(firstButtomModel)
        if let buttonModel = secondButtonModel {
            secondButton.update(buttonModel)
        } else {
            secondButton.view().removeFromSuperview()
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? DialogModel else {
            preconditionFailure("Failed to cast BottomSheetModel")
        }
        self.viewModel = model
        titleLabel.text = model.title
        subtitleLabel.text = model.message
        bindButtomModels(firstButtomModel: model.firstButtomModel, secondButtonModel: model.secondButtonModel)
        switch model.style {
        case let .thumbnail(thumbnailModel):
            thumbnail.update(thumbnailModel)
            avatarContentView.isHidden = true
        case let .avatar(avatarModel):
            avatar.update(avatarModel)
            thumbnailContentView.isHidden = true
        case .default:
            avatar.view().isHidden = true
            thumbnail.view().isHidden = true
            avatarContentView.isHidden = true
            thumbnailContentView.isHidden = true
        }
    }

    func bindAction(_ externalAction: ((DialogAction) -> Void)?) {
        action = { buttonAction in
            externalAction?(buttonAction)
        }
    }
}
