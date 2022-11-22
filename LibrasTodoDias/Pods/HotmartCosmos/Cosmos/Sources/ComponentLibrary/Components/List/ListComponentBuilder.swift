//
//  ListComponentBuilder.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 30/06/21.
//

import Foundation

final class ListComponentBuilder {
    public static func buildBy(style: ListModel.Style) -> ListModel.Component? {
        switch style {
        case let .default(style):
            return buildDefaultComponentBy(style: style)
        case let .control(style):
            return buildControlComponentBy(style: style)
        case let .image(style):
            return buildImageComponentBy(style: style)
        }
    }

    private static func buildDefaultComponentBy(style: ListModel.Style.Default) -> ListModel.Component? {
        switch style {
        case .simple:
            return nil
        case let .tag(model):
            return .right(item: .init(item: .tag(model)))
        case let .leftIcon(icon, color):
            return .left(item: .init(item: .icon(icon, color: color)))
        case let .leftIconTag(icon, color, model):
            return .leftAndRight(
                leftItem: .init(item: .icon(icon, color: color)),
                rightItem: .init(item: .tag(model))
            )
        case let .rightIcon(icon, color):
            return .right(item: .init(item: .icon(icon, color: color)))
        }
    }

    private static func buildControlComponentBy(style: ListModel.Style.Control) -> ListModel.Component? {
        switch style {
        case let .actionLeft(action):
            return .left(item: .init(item: action.getItem()))
        case let .actionLeftRight(leftAction, rightAction):
            return .leftAndRight(
                leftItem: .init(item: leftAction.getItem(), hasClickableArea: true),
                rightItem: .init(item: rightAction.getItem(), hasClickableArea: true)
            )
        case let .switchToggle(model):
            return .right(item: .init(item: .switchToggle(model)))
        case let .accordion(text):
            return .right(item: .init(item: .accordion(text: text)))
        case let .button(model):
            return .right(item: .init(item: .button(model)))
        }
    }

    private static func buildImageComponentBy(style: ListModel.Style.Image) -> ListModel.Component? {
        switch style {
        case let .simple(type):
            return .left(item: .init(item: getImageItemBy(type: type)))
        case let .icon(type, inactiveImage, activeImage, color):
            return .leftAndRight(
                leftItem: .init(item: getImageItemBy(type: type)),
                rightItem: .init(item: .clickableIcon(inactiveImage, activeImage, color), hasClickableArea: true)
            )
        case let .button(type, model):
            return .leftAndRight(
                leftItem: .init(item: getImageItemBy(type: type)),
                rightItem: .init(item: .button(model))
            )
        case let .control(type, action):
            return .leftAndRight(
                leftItem: .init(item: getImageItemBy(type: type)),
                rightItem: .init(item: action.getItem())
            )
        }
    }

    private static func getImageItemBy(type: ListModel.Style.uType) -> ListModel.Component.Item {
        switch type {
        case let .avatar(content, style):
            return .avatar(content, style: style)
        case let .thumbnail(model):
            return .thumbnail(model)
        }
    }
}
