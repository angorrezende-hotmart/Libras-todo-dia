//
//  ThumbnailView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

final class ThumbnailView: ThemedCodedView, Bindable {
    // MARK: Constants

    private enum Constants {
        static let logoSizeMultiplier: CGFloat = 0.3
        static let innerImageSizeMultiplier: CGFloat = 0.625
        static let acessoryHeight: CGFloat = 20.0
        static let borderRadius: CGFloat = BorderRadiusGroup().small.value
        static let res16x9InnerRatio: CGFloat = 0.39
        static let res9x13InnerRatio: CGFloat = 0.45
    }

    // MARK: - Dependencies

    @CosmosInjected var imageFetcher: CosmosImageFetcher

    // MARK: - View Elements

    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = Cosmos.logoSymbols.symbolWhite.image
        return view
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = Constants.borderRadius
        view.layer.borderWidth = 1.0
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = Constants.borderRadius
        view.clipsToBounds = true
        return view
    }()

    private let innerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = Constants.borderRadius
        view.clipsToBounds = true
        return view
    }()

    private let acessoryView: AcessoryView = {
        let view = AcessoryView()
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

    private var imageViewTrailingConstraint: NSLayoutConstraint?

    private var imageViewLeadingConstraint: NSLayoutConstraint?

    private var imageViewTopConstraint: NSLayoutConstraint?

    private var imageViewBottomConstraint: NSLayoutConstraint?

    // MARK: - Private Properties

    private var borderColor: UIColor = .clear

    private var viewModel: ThumbnailModel?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let model = viewModel else {
            return
        }

        bindViewModel(model)
    }

    // MARK: - CodedView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(logoImageView)
        containerView.addSubview(innerImageView)
        containerView.addSubview(acessoryView)
    }

    override func constrainSubviews() {
        layout(using: [
            widthConstraint,
            heightConstraint,
        ])

        containerView.fillSuperview()
        constrainLogoImageView()
        constrainImageView()
        constrainAcessoryView()
    }

    // MARK: - Constrain Methods

    private func constrainLogoImageView() {
        logoImageView.anchorCenterSuperview()

        logoImageView.layout(using: [
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.logoSizeMultiplier),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.logoSizeMultiplier),
        ])

        logoImageView.constraints.forEach {
            $0.priority = .defaultHigh
        }
    }

    private func constrainImageView() {
        let imageViewTrailingConstraint = imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        let imageViewLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: containerView.topAnchor)
        let imageViewBottomConstraint = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)

        imageView.layout(using: [
            imageViewTrailingConstraint,
            imageViewLeadingConstraint,
            imageViewTopConstraint,
            imageViewBottomConstraint,
        ])

        self.imageViewTrailingConstraint = imageViewTrailingConstraint
        self.imageViewLeadingConstraint = imageViewLeadingConstraint
        self.imageViewTopConstraint = imageViewTopConstraint
        self.imageViewBottomConstraint = imageViewBottomConstraint
    }

    private func constrainAcessoryView() {
        acessoryView.anchor(
            bottom: containerView.bottomAnchor,
            trailing: containerView.trailingAnchor,
            bottomConstant: Spacing().spacing1.value,
            trailingConstant: Spacing().spacing1.value,
            heightConstant: Constants.acessoryHeight
        )
    }

    private func constrainLogoImageView(size: ThumbnailSizeProtocol) {
        widthConstraint.constant = size.width
        heightConstraint.constant = size.height
    }

    // MARK: - Private Methods

    private func setupView() {
        layer.cornerRadius = Constants.borderRadius
    }

    private func resetAllImageView() {
        innerImageView.image = nil
        imageView.image = nil
        imageView.backgroundColor = .clear
        containerView.backgroundColor = .clear
        resetPadding()
    }

    private func getImageViewFor(_ style: ThumbnailModel.Style) -> UIImageView {
        switch style {
        case .normal:
            return imageView
        case .innerImage:
            return innerImageView
        }
    }

    private func setupForRemoteImage(_ urlString: String, placeholder: UIImage?, requestBuilder: CosmosMediaRequestBuilding?, style: ThumbnailModel.Style) {
        containerView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color
        let currentImageView = getImageViewFor(style)
        currentImageView.image = nil
        currentImageView.isHidden = false

        currentImageView.fetchImage(
            with: urlString,
            placeholder: placeholder,
            imageFetcher: imageFetcher,
            requestBuilder: requestBuilder,
            completion: { [weak self] image, error, _, _ in
                guard image != nil, error == nil else {
                    return
                }

                self?.logoImageView.isHidden = true

                switch style {
                case let .normal(padding):
                    self?.setupImagePadding(padding: padding)
                    self?.containerView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.clear.color
                case let .innerImage(backgroundColor):
                    self?.containerView.backgroundColor = backgroundColor
                }
            }
        )
    }

    private func setupForLocalPlaceholder(placeholder: UIImage, style: ThumbnailModel.Style) {
        let currentImageView = getImageViewFor(style)

        logoImageView.isHidden = true
        currentImageView.isHidden = false
        currentImageView.image = placeholder

        switch style {
        case let .normal(padding):
            setupImagePadding(padding: padding)
            containerView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.clear.color
        case let .innerImage(backgroundColor):
            containerView.backgroundColor = backgroundColor
        }
    }

    private func setupForEmptyPlaceholder(style: ThumbnailModel.Style) {
        containerView.backgroundColor = .clear
        logoImageView.isHidden = false
        imageView.isHidden = false
        imageView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color

        if case .normal(let padding) = style {
            setupImagePadding(padding: padding)
        }
    }

    private func setupInnerImageSize(_ resolution: ThumbnailResolution) {
        innerImageView.removeConstraints(innerImageView.constraints)
        innerImageView.anchorCenterSuperview()

        switch resolution {
        case .res16x9:
            setInnerRatioTo(ratio: Constants.res16x9InnerRatio)
        case .res1x1:
            setInnerRatioTo(ratio: .one)
        case .res3x4:
            setInnerRatioTo(ratio: .one)
        case .res4x5:
            setInnerRatioTo(ratio: .one)
        case .res9x13:
            setInnerRatioTo(ratio: Constants.res9x13InnerRatio)
        }
    }

    private func setInnerRatioTo(ratio: CGFloat) {
        let size = widthConstraint.constant * ratio
        innerImageView.anchor(
            widthConstant: size,
            heightConstant: size
        )
    }

    private func setupImagePadding(padding: CGFloat) {
        imageViewTrailingConstraint?.constant = -padding
        imageViewLeadingConstraint?.constant = padding
        imageViewTopConstraint?.constant = padding
        imageViewBottomConstraint?.constant = -padding
    }

    private func resetPadding() {
        setupImagePadding(padding: .zero)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ThumbnailModel else {
            return
        }

        self.viewModel = model
        resetAllImageView()

        let contentMode = model.imageContentMode ?? .scaleAspectFill
        let thumbnailSizes = ThumbnailSizes(for: model.resolution)
        let size = thumbnailSizes.getForSize(model.size)

        constrainLogoImageView(size: size)

        acessoryView.isHidden = true
        if let midia = model.accesoryStyle {
            acessoryView.isHidden = false
            acessoryView.setMidia(midia)
        }

        borderColor = model.borderColor?() ?? .clear
        containerView.layer.borderColor = borderColor.cgColor

        imageView.contentMode = contentMode
        innerImageView.contentMode = contentMode

        if let imageUrlString = model.imageUrlString {
            setupForRemoteImage(imageUrlString, placeholder: model.placeholder, requestBuilder: model.requestBuilder, style: model.style)
        } else if let placeholder = model.placeholder {
            setupForLocalPlaceholder(placeholder: placeholder, style: model.style)
        } else {
            setupForEmptyPlaceholder(style: model.style)
        }

        setupInnerImageSize(model.resolution)
    }
}
