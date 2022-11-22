//
//  AvatarView.swift
//  Pods
//
//  Created by Rafael Lage Moreira Barbosa on 29/04/21.
//

import Foundation

final class AvatarView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let numberOfCharsInTextPlaceholder = 2
    }

    // MARK: - Dependencies

    @CosmosInjected var imageFetcher: CosmosImageFetcher

    // MARK: - View Components

    private let label: UILabel = {
        let view = UILabel()
        view.textColor = Cosmos.colors.primaryBrandColor.color.color
        view.isUserInteractionEnabled = false
        return view
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.avatarGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    // MARK: - Constraints

    private lazy var widthConstraint: NSLayoutConstraint = {
        let constraint = widthAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    private lazy var heightConstraint: NSLayoutConstraint = {
        let constraint = heightAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    private lazy var iconWidthConstraint: NSLayoutConstraint = {
        let constraint = iconView.widthAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    private lazy var iconHeightConstraint: NSLayoutConstraint = {
        let constraint = iconView.heightAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    // MARK: - Private Properties

    private var action: ((AvatarAction) -> Void)?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = Cosmos.colors.primaryBrandColor.lightest.color
    }

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(label)
        addSubview(iconView)
        addSubview(imageView)
        accessibilityIdentifier = "avatar_id"
    }

    override func constrainSubviews() {
        layout(using: [
            widthConstraint,
            heightConstraint,
        ])

        constrainLabel()
        constraintImageView()
        constrainIconView()
    }

    // MARK: - Constrain Methods

    private func constrainLabel() {
        label.anchorCenterSuperview()
    }

    private func constraintImageView() {
        imageView.anchorCenterSuperview()

        imageView.layout(using: [
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
        ])

        imageView.constraints.forEach {
            $0.priority = .defaultHigh
        }
    }

    private func constrainIconView() {
        iconView.anchorCenterSuperview()

        iconView.layout(using: [
            iconWidthConstraint,
            iconHeightConstraint,
        ])

        iconView.constraints.forEach {
            $0.priority = .defaultHigh
        }
    }

    // MARK: - Private Methods

    private func constrainAvatar(size: AvatarSizeProtocol) {
        widthConstraint.constant = size.sizeValue
        heightConstraint.constant = size.sizeValue
    }

    private func configureView() {
        clipsToBounds = true
        imageView.image = nil
        label.text = nil
        iconView.image = nil
    }

    private func setupForContent(_ content: AvatarModel.Content, and size: AvatarSizeProtocol) {
        let imageURL: String?
        let forceRefreshImage: Bool
        var placeholderImage: UIImage?
        var imageRequestBuilder: CosmosMediaRequestBuilding?

        switch content {
        case let .URL(urlString, requestBuilder, forceRefresh):
            imageURL = urlString
            imageRequestBuilder = requestBuilder
            forceRefreshImage = forceRefresh
        case let .image(placeholder, urlString, requestBuilder, forceRefresh):
            placeholderImage = placeholder
            imageRequestBuilder = requestBuilder
            imageURL = urlString
            forceRefreshImage = forceRefresh
            setupForLocalImage(placeholder)
        case let .text(text, urlString, requestBuilder, forceRefresh):
            imageURL = urlString
            imageRequestBuilder = requestBuilder
            forceRefreshImage = forceRefresh
            setupForText(text)
        case let .icon(icon, tintColor, urlString, requestBuilder, forceRefresh):
            imageURL = urlString
            imageRequestBuilder = requestBuilder
            forceRefreshImage = forceRefresh
            setupForIcon(icon, tintColor(), and: size)
        default:
            imageURL = nil
            forceRefreshImage = false
        }

        if let imageURL = imageURL, !imageURL.isEmpty {
            setupForRemoteImage(imageURL, placeholder: placeholderImage, requestBuilder: imageRequestBuilder, forceRefresh: forceRefreshImage)
        }
    }

    private func setupForLocalImage(_ image: UIImage) {
        imageView.isHidden = false
        imageView.image = image
    }

    private func setupForText(_ text: String) {
        label.isHidden = false

        let stringArray = text.components(separatedBy: " ")

        if stringArray.count > .one,
           let firstLetter = stringArray.first?.first,
           let secondLetter = stringArray[.one].first {
            label.text = "\(firstLetter)\(secondLetter)"
        } else {
            label.text = String(text.prefix(Constants.numberOfCharsInTextPlaceholder)).uppercased()
        }
    }

    private func setupForIcon(_ icon: IconSet, _ tintColor: UIColor, and size: AvatarSizeProtocol) {
        iconView.isHidden = false
        iconWidthConstraint.constant = size.iconSize
        iconHeightConstraint.constant = size.iconSize
        iconView.image = Cosmos.iconSet(imageType: icon, size: .large)
        iconView.tintColor = tintColor
    }

    private func setupForRemoteImage(_ imageURLString: String, placeholder: UIImage?, requestBuilder: CosmosMediaRequestBuilding?, forceRefresh: Bool) {
        imageView.fetchImage(with: imageURLString, placeholder: placeholder, imageFetcher: imageFetcher, requestBuilder: requestBuilder, forceRefreshImage: forceRefresh, completion: { [weak self] image, _, _, _ in
            if image != nil {
                self?.label.isHidden = true
                self?.iconView.isHidden = true
                self?.backgroundColor = .clear
            }
        })
    }

    @objc
    private func avatarGestureDidRecognize(_ sender: UITapGestureRecognizer?) {
        action?(.tap)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AvatarModel else {
            return
        }

        configureView()

        let avatarSizes = AvatarSizes()
        let avatarStyles = AvatarStyles()

        let avatarSize = avatarSizes.getForSize(model.size)
        let avatarStyle = avatarStyles.getForStyle(model.style)

        constrainAvatar(size: avatarSize)

        switch avatarStyle.style {
        case .rounded:
            layer.cornerRadius = 8.0
        case .circle:
            layer.cornerRadius = avatarSize.sizeValue / 2.0
        }

        label.font = avatarSize.systemFont.font

        setupForContent(model.content, and: avatarSize)
    }

    func bindAction(_ action: ((AvatarAction) -> Void)?) {
        self.action = action
    }
}
