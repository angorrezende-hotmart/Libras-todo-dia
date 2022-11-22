//
//  CardModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import UIKit

public struct CardModel: CosmosModel {
    public var image: ImageToken
    public var acessoryMidia: AcessoryModel.Midia?
    public var orientation: Orientation
    public var description: Description

    public init(
        image: ImageToken,
        acessoryMidia: AcessoryModel.Midia? = nil,
        orientation: Orientation,
        description: Description
    ) {
        self.image = image
        self.acessoryMidia = acessoryMidia
        self.orientation = orientation
        self.description = description
    }

    // MARK: - Enums

    public enum ImageToken {
        /// Token: card_img_1 Proportion: `1:1` *("squared")*
        case img1(image: UIImage?, size: Size, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case img1URL(image: UIImage?, size: Size, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)

        /// Token: card_img_2 Proportion: `4:3` *("wide")*
        case img2(image: UIImage?, size: Size, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case img2URL(image: UIImage?, size: Size, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)

        /// Token: card_img_3 Proportion: `16:9` *("ultra-wide")*
        case img3(image: UIImage?, size: Size, imageContentMode: UIView.ContentMode? = nil, style: Style = .normal(padding: .zero), borderColor: (() -> SystemColor)? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case img3URL(image: UIImage?, size: Size, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, imageContentMode: UIView.ContentMode? = nil, style: Style = .normal(padding: .zero), borderColor: (() -> SystemColor)? = nil)

        /// Token: card_img_4 Proportion: `4:5` *("portrait")*
        case img4(image: UIImage?, size: Size, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case img4URL(image: UIImage?, size: Size, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, imageContentMode: UIView.ContentMode? = nil, borderColor: (() -> SystemColor)? = nil)

        public enum Size {
            case small // thumbnail_sm
            case medium // thumbnail_md
            case large // thumbnail_lg
            case extraLarge // thumbnail_xl
            case custom(width: CGFloat) // thumbnail_custom_width

            func getWidth() -> CGFloat {
                switch self {
                case .small:
                    return 75.0
                case .medium:
                    return 105.0
                case .large:
                    return 145.0
                case .extraLarge:
                    return 165.0
                case let .custom(width):
                    return width
                }
            }
        }

        public enum Style {
            case normal(padding: CGFloat = .zero)
            case innerImage(backgroundColor: UIColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color)
        }

        var system: SystemCardImage {
            let cards = CardImageGroup()
            switch self {
            case .img1, .img1URL:
                return cards.img1
            case .img2, .img2URL:
                return cards.img2
            case .img3, .img3URL:
                return cards.img3
            case .img4, .img4URL:
                return cards.img4
            }
        }

        public func getImage() -> UIImage? {
            switch self {
            case let .img1(image, _, _, _),
                 let .img1URL(image, _, _, _, _, _),
                 let .img2(image, _, _, _),
                 let .img2URL(image, _, _, _, _, _),
                 let .img3(image, _, _, _, _),
                 let .img3URL(image, _, _, _, _, _, _),
                 let .img4(image, _, _, _),
                 let .img4URL(image, _, _, _, _, _):
                return image
            }
        }

        public func copyWithUpdate(image: UIImage?) -> Self {
            switch self {
            case let .img1(_, size, imageContentMode, borderColor):
                return .img1(image: image, size: size, imageContentMode: imageContentMode, borderColor: borderColor)
            case let .img1URL(_, size, _, _, imageContentMode, borderColor):
                return .img1URL(image: image, size: size, imageURL: nil, requestBuilder: nil, imageContentMode: imageContentMode, borderColor: borderColor)
            case let .img2(_, size, imageContentMode, borderColor):
                return .img2(image: image, size: size, imageContentMode: imageContentMode, borderColor: borderColor)
            case let .img2URL(_, size, _, _, imageContentMode, borderColor):
                return .img2URL(image: image, size: size, imageURL: nil, requestBuilder: nil, imageContentMode: imageContentMode, borderColor: borderColor)
            case let .img3(_, size, imageContentMode, style, borderColor):
                return .img3(image: image, size: size, imageContentMode: imageContentMode, style: style, borderColor: borderColor)
            case let .img3URL(_, size, _, _, imageContentMode, style, borderColor):
                return .img3URL(image: image, size: size, imageURL: nil, requestBuilder: nil, imageContentMode: imageContentMode, style: style, borderColor: borderColor)
            case let .img4(_, size, imageContentMode, borderColor):
                return .img4(image: image, size: size, imageContentMode: imageContentMode, borderColor: borderColor)
            case let .img4URL(_, size, _, _, imageContentMode, borderColor):
                return .img4URL(image: image, size: size, imageURL: nil, requestBuilder: nil, imageContentMode: imageContentMode, borderColor: borderColor)
            }
        }

        public func getWidth() -> CGFloat {
            switch self {
            case let .img1(_, size, _, _),
                 let .img1URL(_, size, _, _, _, _),
                 let .img2(_, size, _, _),
                 let .img2URL(_, size, _, _, _, _),
                 let .img3(_, size, _, _, _),
                 let .img3URL(_, size, _, _, _, _, _),
                 let .img4(_, size, _, _),
                 let .img4URL(_, size, _, _, _, _):
                return size.getWidth()
            }
        }

        func getThumnailSizeFrom(size: Size) -> ThumbnailSize {
            switch size {
            case .small:
                return .sm
            case .medium:
                return .md
            case .large:
                return .lg
            case .extraLarge:
                return .xl
            case let .custom(width):
                return .custom(width: width)
            }
        }

        func getThumnailStyle(style: Style) -> ThumbnailModel.Style {
            switch style {
            case let .normal(padding):
                return .normal(padding: padding)
            case let .innerImage(backgroundColor):
                return .innerImage(backgroundColor: backgroundColor)
            }
        }

        private func handledColor(_ systemColor: (() -> SystemColor)?) -> (() -> UIColor)? {
            var handleColor: (() -> UIColor)?

            if let color = systemColor?() {
                handleColor = { color.color }
            }

            return handleColor
        }

        func getThumbnailModel() -> ThumbnailModel {
            switch self {
            case let .img1(image, size, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res1x1,
                    size: getThumnailSizeFrom(size: size),
                    placeholder: image,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )

            case let .img1URL(image, size, imageURL, requestBuilder, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res1x1,
                    size: getThumnailSizeFrom(size: size),
                    accesoryStyle: nil,
                    placeholder: image,
                    imageUrlString: imageURL,
                    requestBuilder: requestBuilder,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )

            case let .img2(image, size, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res3x4,
                    size: getThumnailSizeFrom(size: size),
                    placeholder: image,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )

            case let .img2URL(image, size, imageURL, requestBuilder, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res3x4,
                    size: getThumnailSizeFrom(size: size),
                    accesoryStyle: nil,
                    placeholder: image,
                    imageUrlString: imageURL,
                    requestBuilder: requestBuilder,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )

            case let .img3(image, size, imageContentMode, style, borderColor):
                return ThumbnailModel(
                    resolution: .res16x9,
                    size: getThumnailSizeFrom(size: size),
                    placeholder: image,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor),
                    style: getThumnailStyle(style: style)
                )

            case let .img3URL(image, size, imageURL, requestBuilder, imageContentMode, style, borderColor):
                return ThumbnailModel(
                    resolution: .res16x9,
                    size: getThumnailSizeFrom(size: size),
                    accesoryStyle: nil,
                    placeholder: image,
                    imageUrlString: imageURL,
                    requestBuilder: requestBuilder,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor),
                    style: getThumnailStyle(style: style)
                )

            case let .img4(image, size, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res4x5,
                    size: getThumnailSizeFrom(size: size),
                    placeholder: image,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )
            /// Passing a imageURL will make UIImage act like a placeholder
            case let .img4URL(image, size, imageURL, requestBuilder, imageContentMode, borderColor):
                return ThumbnailModel(
                    resolution: .res4x5,
                    size: getThumnailSizeFrom(size: size),
                    accesoryStyle: nil,
                    placeholder: image,
                    imageUrlString: imageURL,
                    requestBuilder: requestBuilder,
                    imageContentMode: imageContentMode,
                    borderColor: handledColor(borderColor)
                )
            }
        }
    }

    public enum Description {
        /// Token: card_desc_1
        case desc1(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil)
        /// Token: card_desc_3
        case desc2(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, tagTitle: String, tagStyle: TagModel.Style = .gray)
        /// Token: card_desc_3
        case desc3(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, buttonTitle: String)
        /// Token: card_desc_4
        case desc4(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, price: String)
        /// Token: card_desc_5
        case desc5(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, price: String, promotionPrice: String)
        /// Token: card_desc_6
        case desc6(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil)
        /// Token: card_desc_7
        case desc7(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, progress: Float, fullProgressColor: (() -> UIColor)?)
        /// Token: card_desc_8
        case desc8(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil, price: String)
        /// Token: card_desc_9
        case desc9(title: String?, titleNumberOfLines: Int? = nil, author: String?, authorNumberOfLines: Int? = nil)

        var system: SystemCardDescripton {
            let descriptionStyle = CardDescriptionGroup()
            switch self {
            case .desc1:
                return descriptionStyle.desc1
            case .desc2:
                return descriptionStyle.desc2
            case .desc3:
                return descriptionStyle.desc3
            case .desc4:
                return descriptionStyle.desc4
            case .desc5:
                return descriptionStyle.desc5
            case .desc6:
                return descriptionStyle.desc6
            case .desc7:
                return descriptionStyle.desc7
            case .desc8:
                return descriptionStyle.desc8
            case .desc9:
                return descriptionStyle.desc9
            }
        }

        var alignment: UIStackView.Alignment {
            switch self {
            case .desc1, .desc2, .desc3, .desc4, .desc5:
                return .fill
            case .desc6, .desc7, .desc8, .desc9:
                return .center
            }
        }
    }

    public enum Orientation {
        case horizontal
        case vertical
    }
}

public enum CardAction: CosmosAction {
    case secondaryButtonTap
}
