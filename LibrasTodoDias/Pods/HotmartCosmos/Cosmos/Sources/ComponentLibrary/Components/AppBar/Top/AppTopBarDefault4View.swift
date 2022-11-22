//
//  AppTopBarDefault4View.swift
//  HotmartCosmos
//
//  Created by Felipe Freitas Vieira Campidelli on 05/04/22.
//

import Foundation

final class AppTopBarDefault4View: ThemedCodedView, AppTopBarProtocol {
    // MARK: - Constants

    private enum Constants {
        static let imageHeight: CGFloat = 28
        static let iconSpacing: CGFloat = 36
        static let titleSpacing: CGFloat = 20.5
        static let backButtonWidth: CGFloat = 20
        static let buttonContainerPadding: CGFloat = 6
    }

    // MARK: - Dependencies

    @CosmosInjected var imageFetcher: CosmosImageFetcher

    // MARK: - Properties

    private var primaryColor: UIColor {
        Cosmos.colors.primaryBrandColor.color.color
    }

    private var primaryDarkerColor: UIColor {
        Cosmos.colors.primaryBrandColor.darker.color
    }

    private var fontColor: UIColor {
        Cosmos.colors.productColors.neutralProductColor.neutral900.color
    }

    private var viewModel: AppTopBarModel?
    private var action: ((AppTopBarAction) -> Void)?

    private lazy var buttonIndex: [UIButton: Int] = [
        firstButton: 0,
        secondButton: 1,
    ]

    lazy var titleLabelToFirstConstraint = titleLabel.rightAnchor.constraint(equalTo: firstButton.leftAnchor, constant: -Constants.titleSpacing)
    lazy var titleImageToFirstConstraint = titleImageView.rightAnchor.constraint(lessThanOrEqualTo: firstButton.leftAnchor, constant: -Constants.titleSpacing)

    lazy var titleLabelToSecondConstraint = titleLabel.rightAnchor.constraint(equalTo: secondButton.leftAnchor, constant: -Constants.titleSpacing)
    lazy var titleImageToSecondConstraint = titleImageView.rightAnchor.constraint(lessThanOrEqualTo: secondButton.leftAnchor, constant: -Constants.titleSpacing)

    lazy var titleLabelToThirdConstraint = titleLabel.rightAnchor.constraint(equalTo: avatarComponent.view().leftAnchor, constant: -Constants.titleSpacing)
    lazy var titleImageToThirdConstraint = titleImageView.rightAnchor.constraint(lessThanOrEqualTo: avatarComponent.view().leftAnchor, constant: -Constants.titleSpacing)

    // MARK: - View Elements

    private let containerView: UIView = {
        let view = UIView()
        return view
    }()

    private let border = CALayer()

    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(Cosmos.iconSet(imageType: .chevronLeft, size: .medium), for: .normal)
        view.addTarget(self, action: #selector(backButtonDidTouchUpInside(_:)), for: .touchUpInside)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Cosmos.typography.body.text3.font
        return label
    }()

    private lazy var titleImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
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

    private var avatarModel: AvatarModel = .init(
        content: .none,
        size: .xs,
        style: .circle
    )

    private lazy var avatarComponent: Component<AvatarModel, AvatarAction> = {
        let avatar = Cosmos.makeAvatar()
        avatar.update(avatarModel)
        avatar.onEvent? { [weak self] _ in
            self?.action?(.avatarTap)
        }
        return avatar
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backButton.tintColor = fontColor
        titleLabel.textColor = fontColor
        border.backgroundColor = UIColor.black.cgColor
        configurateBorder()
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(titleImageView)
        containerView.addSubview(firstButton)
        containerView.addSubview(secondButton)
        containerView.addSubview(avatarComponent.view())
    }

    override func constrainSubviews() {
        constrainContainerView()
        constrainBackButton()
        constrainTitleLabel()
        constrainTitleImage()
        constrainFirstButton()
        constrainSecondButton()
        constrainAvatarView()
    }

    // MARK: - Constraints

    private func constrainContainerView() {
        containerView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing2.value,
            leadingConstant: Spacing().spacing2.value,
            bottomConstant: Spacing().spacing2.value,
            trailingConstant: Spacing().spacing2.value
        )
    }

    private func constrainBackButton() {
        backButton.anchor(
            top: containerView.topAnchor,
            left: containerView.leftAnchor,
            bottom: containerView.bottomAnchor,
            widthConstant: Constants.backButtonWidth
        )
    }

    private func constrainTitleLabel() {
        titleLabel.anchor(
            top: containerView.topAnchor,
            left: backButton.rightAnchor,
            bottom: containerView.bottomAnchor,
            leftConstant: Spacing().spacing6.value
        )
        titleLabelToFirstConstraint.isActive = true
    }

    private func constrainTitleImage() {
        titleImageView.anchor(
            top: containerView.topAnchor,
            left: backButton.rightAnchor,
            bottom: containerView.bottomAnchor,
            leftConstant: Spacing().spacing4.value,
            heightConstant: Constants.imageHeight
        )
        titleImageToFirstConstraint.isActive = true
    }

    private func constrainFirstButton() {
        firstButton.anchor(
            right: secondButton.leftAnchor,
            rightConstant: Constants.iconSpacing
        )

        firstButton.anchorCenterYToSuperview()
    }

    private func constrainSecondButton() {
        secondButton.anchor(
            right: avatarComponent.view().leftAnchor,
            rightConstant: Spacing().spacing7.value
        )

        secondButton.anchorCenterYToSuperview()
    }

    private func constrainAvatarView() {
        let view = avatarComponent.view()

        view.anchor(
            right: containerView.rightAnchor,
            rightConstant: Constants.buttonContainerPadding
        )
        view.anchorCenterYToSuperview()
    }

    // MARK: - Private Methods

    private func setupImage(_ image: AppTopBarModel.Image?, imageView: UIImageView) {
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
            imageView.fetchImage(
                with: imageURL,
                placeholder: placeholder,
                imageFetcher: imageFetcher,
                requestBuilder: imageRequestBuilder,
                completion: { [weak self] image, error, _, _ in
                    if placeholder == nil, image == nil || error != nil {
                        self?.titleLabel.isHidden = false
                    } else if error != nil {
                        self?.scaleImageView(placeholder)
                        self?.titleLabel.isHidden = true
                    } else {
                        self?.scaleImageView(image)
                        self?.titleLabel.isHidden = true
                    }
                }
            )
        } else if let placeholder = placeholder {
            scaleImageView(placeholder)
            titleLabel.isHidden = true
        }
    }

    private func scaleImageView(_ image: UIImage?) {
        guard let image = image else { return }
        let scaledWidth = (Constants.imageHeight * image.size.width) / image.size.height
        titleImageView.widthAnchor.constraint(equalToConstant: scaledWidth).isActive = true
    }

    private func configurateBorder() {
        border.frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: .one)
        layer.addSublayer(border)
    }

    private func showBorder() {
        border.isHidden = false
    }

    private func hideBorder() {
        border.isHidden = true
    }

    private func clearTitleConstraints() {
        titleLabelToFirstConstraint.isActive = false
        titleImageToFirstConstraint.isActive = false
        titleLabelToSecondConstraint.isActive = false
        titleImageToSecondConstraint.isActive = false
        titleLabelToThirdConstraint.isActive = false
        titleImageToThirdConstraint.isActive = false
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        action?(.searchTextDidChange(string: textField.text))
    }

    @objc
    private func backButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.backButtonTap)
    }

    @objc
    private func barButtonDidTouchUpInside(_ sender: UIButton) {
        let index = buttonIndex[sender] ?? -1
        action?(.barButtonTap(index: index))
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AppTopBarModel else {
            return
        }

        self.viewModel = model

        titleLabel.font = model.titleCustomFont?.font ?? Cosmos.typography.bodyStrong.text2Strong.font

        switch model.style {
        case let .default4(title, titleImage, avatar, firstButtonImage, secondButtonImage, tintColor, withBorder):
            titleLabel.text = title
            avatarModel.content = avatar
            avatarComponent.update(avatarModel)
            firstButton.setImage(firstButtonImage, for: .normal)
            firstButton.isHidden = firstButtonImage == nil
            secondButton.setImage(secondButtonImage, for: .normal)
            secondButton.isHidden = secondButtonImage == nil
            setupImage(titleImage, imageView: titleImageView)
            withBorder ? showBorder() : hideBorder()

            if let buttonColor = tintColor?() {
                firstButton.tintColor = buttonColor.color
                secondButton.tintColor = buttonColor.color
            }

            clearTitleConstraints()
            if firstButtonImage == nil, secondButtonImage == nil {
                titleLabelToThirdConstraint.isActive = true
                titleImageToThirdConstraint.isActive = true
            } else if firstButtonImage == nil {
                titleLabelToSecondConstraint.isActive = true
                titleImageToSecondConstraint.isActive = true
            } else {
                titleLabelToFirstConstraint.isActive = true
                titleImageToFirstConstraint.isActive = true
            }

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
