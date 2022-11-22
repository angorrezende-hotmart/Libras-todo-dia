//
//  ButtonModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import Foundation

public struct ButtonModel: CosmosModel {
    public var title: String
    public var style: Style
    public var icon: IconStyle
    public var size: Size
    public var state: State
    public var accessibility: SystemAccessibility?
    public var textColor: (() -> UIColor)?

    public init(
        title: String,
        style: Style,
        icon: IconStyle,
        size: Size,
        state: State = .normal,
        accessibility: SystemAccessibility? = nil,
        textColor: (() -> UIColor)? = nil
    ) {
        self.title = title
        self.style = style
        self.icon = icon
        self.size = size
        self.state = state
        self.accessibility = accessibility
        self.textColor = textColor
    }

    // MARK: - Enums

    public enum Style: String, CaseIterable {
        case primary
        case secondary
        case tertiary
        case `default`
        case cta
        case danger
        case custom
    }

    public enum State {
        case normal
        case loading
        case disabled
        case highlighted
    }

    public enum IconStyle: Equatable {
        case without
        case left(icon: IconSet)
        case right(icon: IconSet)
        case only(icon: IconSet)
        func getName() -> String {
            switch self {
            case .without:
                return ""
            case .left:
                return "_left_icon"
            case .right:
                return "_right_icon"
            case .only:
                return "_only_icon"
            }
        }
    }

    public enum Size: String {
        case medium
        case small
    }

    public func getSystemButton() -> SystemButton {
        switch style {
        case .primary:
            return PrimaryButton()
        case .secondary:
            return SecondaryButton()
        case .tertiary:
            return TertiaryButton()
        case .default:
            return DefaultButton()
        case .cta:
            return CTAButton()
        case .danger:
            return DangerButton()
        case .custom:
            return CustomButton()
        }
    }

    public func getTokenName() -> String {
        style.rawValue + "_" + size.rawValue + icon.getName() + (state == .disabled ? "_disabled" : "")
    }
}

public enum ButtonAction: CosmosAction {
    case tap(model: ButtonModel?)
}
