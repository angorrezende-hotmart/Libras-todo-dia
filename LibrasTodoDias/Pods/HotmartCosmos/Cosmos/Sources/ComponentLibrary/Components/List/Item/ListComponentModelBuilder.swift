//
//  ListComponentModelBuilder.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 25/06/21.
//

import Foundation

final class ListComponentModelBuilder {
    public static func build(for model: ListModel, and action: ((ListAction) -> Void)? = nil) -> [ListComponentItemModel] {
        switch model.component {
        case .left(let clickableItem):
            return [
                buildModelForItem(
                    clickableItem.item,
                    hasClickableArea: clickableItem.hasClickableArea,
                    in: .left,
                    with: action,
                    isActive: model.isActive
                ),
            ]
        case .right(let clickableItem):
            return [
                buildModelForItem(
                    clickableItem.item,
                    hasClickableArea: clickableItem.hasClickableArea,
                    in: .right,
                    with: action,
                    isActive: model.isActive
                ),
            ]
        case let .leftAndRight(leftItem, rightItem):
            return [
                buildModelForItem(
                    leftItem.item,
                    hasClickableArea: leftItem.hasClickableArea,
                    in: .left,
                    with: action,
                    isActive: model.isActive
                ),
                buildModelForItem(
                    rightItem.item,
                    hasClickableArea: rightItem.hasClickableArea,
                    in: .right,
                    with: action,
                    isActive: model.isActive
                ),
            ]
        case .none:
            return []
        }
    }

    private static func buildModelForItem(
        _ item: ListModel.Component.Item,
        hasClickableArea: Bool,
        in position: ListComponentItemModel.Position,
        with action: ((ListAction) -> Void)? = nil,
        isActive: Bool
    ) -> ListComponentItemModel {
        var model = ListComponentItemModel(postion: position, isActive: isActive, hasClickableArea: hasClickableArea)
        switch item {
        case .radio:
            model.image = ListComponentItemModel.Image(
                activeImage: Cosmos.iconSet(imageType: .radioButtonOn, size: .large),
                inactiveImage: Cosmos.iconSet(imageType: .radioButton, size: .large),
                tintColor: { Cosmos.colors.productColors.neutralProductColor.neutral900 }
            )
        case .checkbox:
            model.image = ListComponentItemModel.Image(
                activeImage: Cosmos.iconSet(imageType: .checkboxOn, size: .large),
                inactiveImage: Cosmos.iconSet(imageType: .checkbox, size: .large),
                tintColor: { Cosmos.colors.productColors.neutralProductColor.neutral900 }
            )
        case let .switchToggle(switchModel):
            model.componentStyle = .switchToggle(
                switchModel,
                action: (
                    action,
                    position
                )
            )
        case .drag:
            model.image = ListComponentItemModel.Image(
                defaultImage: Cosmos.iconSet(imageType: .drag, size: .large),
                tintColor: { Cosmos.colors.productColors.neutralProductColor.neutral900 }
            )
        case let .accordion(text):
            model.text = text
            model.animation = .rotation
            model.image = ListComponentItemModel.Image(
                defaultImage: Cosmos.iconSet(imageType: .expandMore, size: .medium),
                tintColor: { Cosmos.colors.productColors.neutralProductColor.neutral900 }
            )
        case let .avatar(content, style):
            model.componentStyle = .avatar(
                content,
                style: style,
                action: (
                    action,
                    position
                )
            )
        case .thumbnail(let thumbnailModel):
            model.componentStyle = .thumbnail(thumbnailModel)
        case .tag(let tagModel):
            model.componentStyle = .tag(tagModel)
        case .button(let buttonModel):
            model.componentStyle = .button(
                buttonModel,
                action: (
                    action,
                    position
                )
            )
        case let .icon(image, color):
            model.image = ListComponentItemModel.Image(
                defaultImage: Cosmos.iconSet(imageType: image, size: .medium),
                tintColor: color
            )
        case let .clickableIcon(inactiveImage, activeImage, color):
            model.image = ListComponentItemModel.Image(
                activeImage: Cosmos.iconSet(imageType: activeImage, size: .medium),
                inactiveImage: Cosmos.iconSet(imageType: inactiveImage, size: .medium),
                tintColor: color
            )
        }
        return model
    }
}
