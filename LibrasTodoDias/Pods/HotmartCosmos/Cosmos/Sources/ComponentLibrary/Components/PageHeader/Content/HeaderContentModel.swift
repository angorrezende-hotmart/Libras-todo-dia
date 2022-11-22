//
//  HeaderContentModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 22/10/21.
//

import Foundation

public struct HeaderContentModel: CosmosModel {
    public var avatar: AvatarModel
    public var title: String
    public var description: TruncatedLabelModel
    public var style: Style

    public init(
        avatar: AvatarModel,
        title: String,
        description: TruncatedLabelModel,
        style: Style
    ) {
        self.avatar = avatar
        self.title = title
        self.description = description
        self.style = style
    }

    public enum Style {
        case `default`
        case tags(firstTag: TagModel, secondTag: TagModel?, thirdTag: TagModel?)
    }

    public func getSystem() -> SystemHeaderContent {
        let group = HeaderContentGroup()
        switch style {
        case .default:
            return group.headerDesc
        case .tags:
            return group.headerDescTag
        }
    }
}

public enum HeaderContentActions {
    case onTapAvatar
    case onTapDescription
}
