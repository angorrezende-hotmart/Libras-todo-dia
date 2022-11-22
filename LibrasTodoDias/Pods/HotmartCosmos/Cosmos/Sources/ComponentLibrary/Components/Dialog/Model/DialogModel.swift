//
//  DialogModel.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 08/11/21.
//

import Foundation

public struct DialogModel: CosmosModel {
    public var style: Style
    public var title: String
    public var message: String
    public var firstButtomModel: ButtonModel
    public var secondButtonModel: ButtonModel?

    public init(
        style: Style,
        tilte: String,
        message: String,
        firstButtomModel: ButtonModel,
        secondButtonModel: ButtonModel? = nil
    ) {
        self.style = style
        title = tilte
        self.message = message
        self.firstButtomModel = firstButtomModel
        self.secondButtonModel = secondButtonModel
    }

    public enum Style {
        case `default`
        case thumbnail(thumbnailModel: ThumbnailModel)
        case avatar(avatarModel: AvatarModel)
    }
}

public enum DialogAction: CosmosAction {
    case firstButtonTap
    case secondButtonTap
    case close
}
