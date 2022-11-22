//
//  ListModel.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct ListModel: CosmosModel, Equatable {
    public var title: String
    public var description: String?
    public var titleStyle: TextualContentModel.TitleStyle?
    public var descriptionStyle: TextualContentModel.DescriptionStyle?
    public var isVerified: Bool
    public var style: Style
    public var hasDivider: Bool
    public var action: ListAction?
    public var isActive: Bool

    public init(
        title: String,
        description: String? = nil,
        titleStyle: TextualContentModel.TitleStyle? = nil,
        descriptionStyle: TextualContentModel.DescriptionStyle? = nil,
        isVerified: Bool = false,
        style: Style,
        hasDivider: Bool = false,
        isActive: Bool = false
    ) {
        self.title = title
        self.description = description
        self.titleStyle = titleStyle
        self.descriptionStyle = descriptionStyle
        self.isVerified = isVerified
        self.style = style
        self.hasDivider = hasDivider
        self.isActive = isActive
    }

    // MARK: - Equatable

    public static func == (lhs: ListModel, rhs: ListModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.isVerified == rhs.isVerified &&
            lhs.hasDivider == rhs.hasDivider
    }

    // MARK: - Enums

    public enum Style {
        case `default`(_ style: Default)
        case control(_ style: Control)
        case image(_ style: Image)

        public enum Default {
            case simple
            case tag(_ model: TagModel)
            case leftIcon(_ icon: IconSet, color: () -> SystemColor = { Cosmos.colors.productColors.neutralProductColor.neutral900 })
            case leftIconTag(_ icon: IconSet, color: () -> SystemColor = { Cosmos.colors.productColors.neutralProductColor.neutral900 }, model: TagModel)
            case rightIcon(_ icon: IconSet, color: () -> SystemColor = { Cosmos.colors.productColors.neutralProductColor.neutral900 })
        }

        public enum Control {
            case actionLeft(_ action: Action)
            case actionLeftRight(_ leftAction: Action, _ rightAction: Action)
            case switchToggle(_ model: SwitchModel)
            case accordion(text: String?)
            case button(model: ButtonModel)
        }

        public enum Action {
            case radio
            case checkbox
            case switchToggle(_ model: SwitchModel)
            case drag
            case accordion(text: String?)
            case clickableIcon(_ inactiveImage: IconSet, _ activeImage: IconSet, _ color: () -> SystemColor)
            case button(model: ButtonModel)
            func getItem() -> Component.Item {
                switch self {
                case .radio:
                    return .radio
                case .checkbox:
                    return .checkbox
                case let .switchToggle(model):
                    return .switchToggle(model)
                case .drag:
                    return .drag
                case let .accordion(text):
                    return .accordion(text: text)
                case let .clickableIcon(inactiveImage, activeImage, color):
                    return .clickableIcon(inactiveImage, activeImage, color)
                case let .button(model):
                    return .button(model)
                }
            }
        }

        public enum Image {
            case simple(_ type: uType)
            case icon(_ type: uType, inactiveImage: IconSet, activeImage: IconSet, color: () -> SystemColor = { Cosmos.colors.productColors.neutralProductColor.neutral900 })
            case button(_ type: uType, model: ButtonModel)
            case control(_ type: uType, _ rightAction: Action)
        }

        public enum uType {
            case avatar(_ content: AvatarModel.Content, style: AvatarStyle = .circle)
            case thumbnail(_ model: ThumbnailModel)
        }
    }

    public var component: Component? {
        ListComponentBuilder.buildBy(style: style)
    }

    public enum Position {
        case left
        case right
        case leftAndRight
    }

    public enum Component {
        case left(item: ClickableItem)
        case right(item: ClickableItem)
        case leftAndRight(leftItem: ClickableItem, rightItem: ClickableItem)

        public enum Item {
            case radio
            case checkbox
            case switchToggle(_ model: SwitchModel)
            case drag
            case accordion(text: String?)
            case avatar(_ content: AvatarModel.Content, style: AvatarStyle)
            case thumbnail(_ model: ThumbnailModel)
            case tag(_ model: TagModel)
            case button(_ model: ButtonModel)
            case icon(_ image: IconSet, color: () -> SystemColor)
            case clickableIcon(_ inactiveImage: IconSet, _ activeImage: IconSet, _ color: () -> SystemColor)
        }

        public struct ClickableItem {
            let item: Item
            let hasClickableArea: Bool

            public init(
                item: ListModel.Component.Item,
                hasClickableArea: Bool = false
            ) {
                self.item = item
                self.hasClickableArea = hasClickableArea
            }
        }
    }

    public func getSystemList() -> SystemList {
        switch style {
        case let .default(style):
            switch style {
            case .simple:
                return DefaultSimpleList()
            case .tag:
                return DefaultTagList()
            case .leftIcon:
                return DefaultLeftIconList()
            case .leftIconTag:
                return DefaultLeftIconTagList()
            case .rightIcon:
                return DefaultRightIconList()
            }
        case let .control(style):
            switch style {
            case .actionLeft:
                return ControlActionLeftList()
            case .actionLeftRight:
                return ControlActionLeftRightList()
            case .switchToggle:
                return ControlSwitchList()
            case .accordion:
                return ControlAccordionList()
            case .button:
                return ControlButtonList()
            }
        case let .image(style):
            switch style {
            case .simple:
                return ImageList()
            case .icon:
                return ImageIconList()
            case .button:
                return ImageButtonList()
            case .control:
                return ImageControlList()
            }
        }
    }

    public func getTokenName() -> String {
        "list_" + getSystemList().tokenName
    }
}

public enum ListAction: CosmosAction {
    case leftActionTap(_ isActive: Bool)
    case rightActionTap(_ isActive: Bool)
    case listTap(_ isActive: Bool)
}
