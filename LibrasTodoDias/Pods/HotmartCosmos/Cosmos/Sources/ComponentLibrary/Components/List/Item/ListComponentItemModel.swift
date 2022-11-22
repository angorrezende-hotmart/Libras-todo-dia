//
//  ListComponentItemModel.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 24/06/21.
//

import Foundation

public struct ListComponentItemModel: CosmosModel {
    public var componentStyle: ComponentStyle?
    public var text: String?
    public var image: Image?
    public var postion: Position
    public var animation: Animation?
    public var isActive: Bool
    public var hasClickableArea: Bool

    public init(
        componentStyle: ComponentStyle? = nil,
        text: String? = nil,
        image: Image? = nil,
        postion: Position,
        animation: Animation? = nil,
        isActive: Bool = false,
        hasClickableArea: Bool = false
    ) {
        self.componentStyle = componentStyle
        self.text = text
        self.image = image
        self.postion = postion
        self.animation = animation
        self.isActive = isActive
        self.hasClickableArea = hasClickableArea
    }

    public enum ComponentStyle {
        public typealias Action = (listAction: ((ListAction) -> Void)?, position: ListComponentItemModel.Position)

        case avatar(_ content: AvatarModel.Content, style: AvatarStyle, action: Action)
        case button(_ model: ButtonModel, action: Action)
        case switchToggle(_ model: SwitchModel, action: Action)
        case tag(_ model: TagModel)
        case thumbnail(_ model: ThumbnailModel)
        func getView() -> UIView {
            ListComponentViewBuilder.build(for: self)
        }
    }

    public struct Image {
        public var defaultImage: UIImage?
        public var activeImage: UIImage?
        public var inactiveImage: UIImage?
        public var tintColor: (() -> SystemColor)?

        public init(
            defaultImage: UIImage? = nil,
            activeImage: UIImage? = nil,
            inactiveImage: UIImage? = nil,
            tintColor: (() -> SystemColor)? = nil
        ) {
            self.defaultImage = defaultImage
            self.activeImage = activeImage
            self.inactiveImage = inactiveImage
            self.tintColor = tintColor
        }
    }

    public enum Position {
        case left
        case right
    }

    public enum Animation {
        case rotation
    }
}

public enum ListComponentItemAction: CosmosAction {
    case tap(isActive: Bool)
}
