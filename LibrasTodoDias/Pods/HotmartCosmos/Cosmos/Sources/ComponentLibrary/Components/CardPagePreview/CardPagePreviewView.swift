//
//  CardPagePreviewView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 13/05/21.
//

import Foundation

final class CardPagePreviewView: ThemedCodedView, Bindable {
    // MARK: - Dependencies

    @CosmosInjected var imageFetcher: CosmosImageFetcher

    // MARK: - Constants

    private enum Constants {
        static let width: CGFloat = 240.0
        static let previewHeight: CGFloat = 72.0
    }

    // MARK: - Components

    private let avatarComponent: Component<AvatarModel, AvatarAction> = Cosmos.makeAvatar()

    private let buttonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private var avatarModel: AvatarModel = .init(
        content: .none,
        size: .md,
        style: .circle
    )

    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing4.value
            $0.distribution = .fill

        }.build()

        stackView.layer.cornerRadius = 4
        stackView.clipsToBounds = true

        return stackView
    }()

    private let titleStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fill
        }.build()

        stackView.layer.cornerRadius = 4
        stackView.clipsToBounds = true

        return stackView
    }()

    private let pageStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill
            $0.alignment = .fill
        }.build()

        stackView.layer.cornerRadius = 4
        stackView.clipsToBounds = true

        return stackView
    }()

    private let previewStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = .zero
            $0.distribution = .fillEqually
        }.build()

        stackView.layer.cornerRadius = 8
        stackView.clipsToBounds = true

        return stackView
    }()

    private lazy var avatarView: UIView = {
        let view = avatarComponent.view()
        avatarComponent.update(avatarModel)
        avatarComponent.onEvent? { [weak self] _ in
            self?.action?(.avatarTap)
        }
        return view
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private let subtitleLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageViewGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }()

    private lazy var firstImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageViewGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }()

    private lazy var secondImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageViewGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }()

    private lazy var thirdImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageViewGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }()

    private lazy var buttonView: UIView = buttonComponent.view()

    // MARK: - Private Propeties

    private var typography: FontFamily {
        Cosmos.typography
    }

    private var action: ((CardPagePreviewAction) -> Void)?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        layer.borderColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color.cgColor
        titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        subtitleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral600.color
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)

        titleStackView.addSpacingViewOfHeight(5)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        titleStackView.addSpacingViewOfHeight(5)

        pageStackView.addArrangedSubview(avatarView)
        pageStackView.addArrangedSubview(titleStackView)

        previewStackView.addArrangedSubview(firstImageView)
        previewStackView.addArrangedSubview(secondImageView)
        previewStackView.addArrangedSubview(thirdImageView)

        mainStackView.addArrangedSubview(pageStackView)
        mainStackView.addArrangedSubview(previewStackView)
        mainStackView.addArrangedSubview(buttonView)
    }

    override func constrainSubviews() {
        anchor(widthConstant: Constants.width)
        constrainMainStackView()
        constrainPreviewStackView()
    }

    private func constrainMainStackView() {
        let spacing = Spacing().spacing5.value

        mainStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: spacing,
            leadingConstant: spacing,
            bottomConstant: spacing,
            trailingConstant: spacing
        )
    }

    private func constrainPreviewStackView() {
        previewStackView.anchor(
            heightConstant: Constants.previewHeight
        )
    }

    // MARK: - Private Methods

    @objc
    private func imageViewGestureDidRecognize(_ sender: UITapGestureRecognizer?) {
        let index: Int

        switch sender?.view {
        case firstImageView:
            index = 0
        case secondImageView:
            index = 1
        case thirdImageView:
            index = 2
        default:
            index = 0
        }

        action?(.previewTap(index: index))
    }

    private func configureView() {
        layer.cornerRadius = BorderRadiusGroup().small.value
        layer.borderWidth = .one
        clipsToBounds = true
    }

    private func setupImage(_ image: CardPagePreviewModel.Image?, imageView: UIImageView) {
        let imageURL: String?
        var placeholder: UIImage?
        var imageRequestBuilder: CosmosMediaRequestBuilding?

        switch image {
        case let .URL(urlString, requestBuilder):
            imageURL = urlString
            imageRequestBuilder = requestBuilder
        case let .image(placeholderImage, urlString, requestBuilder):
            imageView.image = placeholderImage
            imageURL = urlString
            placeholder = placeholderImage
            imageRequestBuilder = requestBuilder
        default:
            imageURL = nil
        }

        if let imageURL = imageURL {
            imageView.fetchImage(with: imageURL, placeholder: placeholder, imageFetcher: imageFetcher, requestBuilder: imageRequestBuilder)
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? CardPagePreviewModel else {
            return
        }

        configureView()

        titleLabel.text = model.title
        titleLabel.font = typography.bodyStrong.text1Strong.font

        subtitleLabel.text = model.subtitle
        subtitleLabel.font = typography.body.text1.font

        switch model.avatar {
        case let .URL(imageURL, requestBuilder):
            avatarModel.content = .URL(imageURL: imageURL, requestBuilder: requestBuilder)
        case let .image(image, imageURL, requestBuilder):
            avatarModel.content = .image(image, imageURL: imageURL, requestBuilder: requestBuilder)
        default:
            avatarModel.content = .text(model.title, imageURL: nil)
        }

        avatarComponent.update(avatarModel)

        setupImage(model.firstImage, imageView: firstImageView)
        setupImage(model.secondImage, imageView: secondImageView)
        setupImage(model.thirdImage, imageView: thirdImageView)

        if let buttonTitle = model.buttonTitle {
            buttonComponent.update(
                .init(
                    title: buttonTitle,
                    style: model.buttonStyle ?? .secondary,
                    icon: .without,
                    size: .small,
                    accessibility: nil
                )
            )
            buttonView.isHidden = false
        } else {
            buttonView.isHidden = true
        }

        buttonComponent.onEvent? { [weak self] _ in
            self?.action?(.buttonTap)
        }
    }

    func bindAction(_ externalAction: ((CardPagePreviewAction) -> Void)?) {
        action = { action in
            externalAction?(action)
        }
    }
}
