//
//  ToastModel.swift
//  HotmartCosmos
//
//  Created by Felipe Freitas Vieira Campidelli on 14/03/22.
//

import Foundation

public struct ToastModel: CosmosModel {
    public var text: String?
    public var style: Style
    public var time: Time
    public var icon: IconStyle
    public var indicator: Bool

    public init(
        text: String,
        style: Style,
        time: Time = .medium,
        icon: IconStyle = .none,
        indicator: Bool = false
    ) {
        self.text = text
        self.style = style
        self.time = time
        self.icon = icon
        self.indicator = indicator
    }

    public enum Time {
        case fast
        case medium
        case slow
        case custom(seconds: CGFloat)
        case permanent
    }

    public enum Style: String, CaseIterable {
        case `default`
        case success
        case warning
        case danger
    }

    public enum IconStyle {
        case none
        case left(icon: IconSet)
    }
}

public enum ToastAction: CosmosAction {
    case tap(model: ToastModel?)
    case didDisappear
}
