//
//  OutlinedCardModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 12/11/21.
//

import Foundation

public struct OutlinedCardModel: CosmosModel {
    public var icon: IconSet
    public var title: String
    public var tagModel: TagModel?
    public var style: Style
    public var size: OutlinedCardSize

    public init(
        icon: IconSet,
        title: String,
        tagModel: TagModel? = nil,
        style: OutlinedCardModel.Style,
        size: OutlinedCardSize
    ) {
        self.icon = icon
        self.title = title
        self.tagModel = tagModel
        self.style = style
        self.size = size
    }

    public enum Style: Equatable {
        case `default`(description: String)
        case shortAction

        func getSystem() -> SystemOutlinedCard {
            let group = OutlinedCardGroup()
            switch self {
            case .default:
                return group.default
            case .shortAction:
                return group.shortAction
            }
        }
    }
}

public enum OutlinedCardAction: CosmosAction {
    case tap
}
