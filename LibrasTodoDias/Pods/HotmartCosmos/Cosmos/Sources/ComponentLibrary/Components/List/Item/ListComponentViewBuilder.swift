//
//  ListComponentViewBuilder.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 01/07/21.
//

import UIKit

final class ListComponentViewBuilder {
    public static func build(for style: ListComponentItemModel.ComponentStyle) -> UIView {
        switch style {
        case let .avatar(content, style, action):
            let model: AvatarModel = .init(
                content: content,
                size: .md,
                style: style
            )

            let component = Cosmos.makeAvatar()
            return prepareComponentViewWithAction(component, model: model, action: action)
        case let .button(model, action):
            let component = Cosmos.makeButton()
            return prepareComponentViewWithAction(component, model: model, action: action)
        case let .switchToggle(model, action):
            let component = Cosmos.makeSwitch()
            return prepareComponentViewWithAction(component, model: model, action: action)
        case let .tag(model):
            let component = Cosmos.makeTag()
            return prepareComponentView(component, model: model)
        case let .thumbnail(model):
            let component = Cosmos.makeThumbnail()
            return prepareComponentView(component, model: model)
        }
    }

    private static func prepareComponentView<T: CosmosModel, Void>(_ component: Component<T, Void>, model: T) -> UIView {
        component.update(model)
        return component.view()
    }

    private static func prepareComponentViewWithAction<T: CosmosModel, U: CosmosAction>(_ component: Component<T, U>, model: T, action: ListComponentItemModel.ComponentStyle.Action? = nil) -> UIView {
        if let action = action {
            let componentAction: ((U) -> Void) = { insideAction in
                if case let .toggle(isOn) = (insideAction as? SwitchAction) {
                    componentActionSide(action: action.listAction, position: action.position, isActive: isOn)
                } else {
                    componentActionSide(action: action.listAction, position: action.position)
                }
            }
            component.onEvent?(componentAction)
        }

        return prepareComponentView(component, model: model)
    }

    private static func componentActionSide(action: ((ListAction) -> Void)?, position: ListComponentItemModel.Position, isActive: Bool = false) {
        switch position {
        case .left:
            action?(.leftActionTap(isActive))
        case .right:
            action?(.rightActionTap(isActive))
        }
    }
}
