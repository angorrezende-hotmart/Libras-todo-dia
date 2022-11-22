//
//  AvatarModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

public struct AvatarModel: CosmosModel {
    public var content: Content
    public var size: AvatarSize
    public var style: AvatarStyle

    public init(
        content: Content,
        size: AvatarSize,
        style: AvatarStyle
    ) {
        self.content = content
        self.size = size
        self.style = style
    }

    public enum Content {
        case none
        case URL(imageURL: String, requestBuilder: CosmosMediaRequestBuilding? = nil, forceRefresh: Bool = false)
        /// Passing a imageURL will make UIImage act like a placeholder
        case image(_ image: UIImage, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, forceRefresh: Bool = false)
        /// Passing a imageURL will make the String act like a placeholder
        case text(_ text: String, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, forceRefresh: Bool = false)
        /// Passing a imageURL will make the Icon act like a placeholder
        case icon(_ icon: IconSet, tintColor: () -> UIColor = { Cosmos.colors.primaryBrandColor.color.color }, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil, forceRefresh: Bool = false)
    }
}

public enum AvatarAction: CosmosAction {
    case tap
}
