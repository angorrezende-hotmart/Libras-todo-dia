//
//  CardImageView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

final class CardImageView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let acessoryWidth: CGFloat = 64.0
        static let acessoryHeight: CGFloat = 20.0
    }

    // MARK: - Dependencies

    @CosmosInjected var imageFetcher: CosmosImageFetcher

    // MARK: - Properties

    private var viewModel: CardModel?

    // MARK: - View Elements

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = BorderRadiusGroup().small.value
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let acessoryView: AcessoryView = {
        let view = AcessoryView()

        return view
    }()

    // MARK: - Constraints

    private lazy var imageWidthConstraint: NSLayoutConstraint = imageView.widthAnchor.constraint(equalToConstant: .zero)

    private lazy var image1by1ProportionConstraint: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1)

    private lazy var image4by3ProportionConstraint: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3 / 4)

    private lazy var image16by9ProportionConstraint: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 9 / 16)

    private lazy var image4by5ProportionConstraint: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 5 / 4)

    // MARK: - ThemedCodedView

    override func configurateColors() {
        imageView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color
        guard let viewModel = viewModel else {
            return
        }

        bindViewModel(viewModel)
    }

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(imageView)
        addSubview(acessoryView)
    }

    override func constrainSubviews() {
        imageView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )

        imageView.layout(using: [
            imageWidthConstraint,
        ])

        acessoryView.anchor(
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            bottomConstant: Spacing().spacing2.value,
            trailingConstant: Spacing().spacing2.value,
            heightConstant: Constants.acessoryHeight
        )
    }

    // MARK: - Private Methods

    private func deactivateImageConstraints() {
        image1by1ProportionConstraint.isActive = false
        image4by3ProportionConstraint.isActive = false
        image16by9ProportionConstraint.isActive = false
        image4by5ProportionConstraint.isActive = false
    }

    private func setupImageConstraints(_ viewModel: CardModel) {
        deactivateImageConstraints()

        switch viewModel.image.system.resolution {
        case .squared:
            image1by1ProportionConstraint.isActive = true
        case .wide:
            image4by3ProportionConstraint.isActive = true
        case .ultraWide:
            image16by9ProportionConstraint.isActive = true
        case .portrait:
            image4by5ProportionConstraint.isActive = true
        }

        imageWidthConstraint.constant = viewModel.image.getWidth()
    }

    private func setupImage(_ viewModel: CardModel) {
        let imageURL: String?
        let placeholderImage: UIImage?
        let imageRequestBuilder: CosmosMediaRequestBuilding?
        let imageMode: UIView.ContentMode?

        switch viewModel.image {
        case let .img1URL(placeholder, _, urlString, requestBuilder, imageContentMode, _),
             let .img2URL(placeholder, _, urlString, requestBuilder, imageContentMode, _),
             let .img3URL(placeholder, _, urlString, requestBuilder, imageContentMode, _, _),
             let .img4URL(placeholder, _, urlString, requestBuilder, imageContentMode, _):
            imageURL = urlString
            placeholderImage = placeholder
            imageRequestBuilder = requestBuilder
            imageMode = imageContentMode
        default:
            imageURL = nil
            placeholderImage = nil
            imageRequestBuilder = nil
            imageMode = nil
        }

        if let imageURL = imageURL {
            imageView.fetchImage(
                with: imageURL,
                placeholder: placeholderImage,
                imageFetcher: imageFetcher,
                requestBuilder: imageRequestBuilder
            )
        } else {
            imageView.image = viewModel.image.getImage()
        }

        if let imageMode = imageMode {
            imageView.contentMode = imageMode
        }

        setupImageConstraints(viewModel)
    }

    private func setupAccesoryMidia(_ viewModel: CardModel) {
        if let acessory = viewModel.acessoryMidia {
            acessoryView.setMidia(acessory)
            acessoryView.isHidden = false
        } else {
            acessoryView.isHidden = true
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let viewModel = viewModel as? CardModel else {
            return
        }

        self.viewModel = viewModel
        setupImage(viewModel)
        setupAccesoryMidia(viewModel)
    }
}
