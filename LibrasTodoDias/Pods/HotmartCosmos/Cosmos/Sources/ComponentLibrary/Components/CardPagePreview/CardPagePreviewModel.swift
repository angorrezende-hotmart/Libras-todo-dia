//
//  CardPagePreviewModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 13/05/21.
//

import Foundation

public struct CardPagePreviewModel: CosmosModel {
    public var title: String
    public var subtitle: String
    public var avatar: Image?
    public var firstImage: Image?
    public var secondImage: Image?
    public var thirdImage: Image?
    public var buttonTitle: String?
    public var buttonStyle: ButtonModel.Style?

    public init(
        title: String,
        subtitle: String,
        avatar: Image? = nil,
        firstImage: Image? = nil,
        secondImage: Image? = nil,
        thirdImage: Image? = nil,
        buttonTitle: String? = nil,
        buttonStyle: ButtonModel.Style? = .secondary
    ) {
        self.title = title
        self.subtitle = subtitle
        self.avatar = avatar
        self.firstImage = firstImage
        self.secondImage = secondImage
        self.thirdImage = thirdImage
        self.buttonTitle = buttonTitle
        self.buttonStyle = buttonStyle
    }

    public enum Image {
        case none
        case URL(imageURL: String, requestBuilder: CosmosMediaRequestBuilding? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case image(_ image: UIImage, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil)
    }
}

public enum CardPagePreviewAction: CosmosAction {
    case avatarTap
    case previewTap(index: Int)
    case buttonTap
}
