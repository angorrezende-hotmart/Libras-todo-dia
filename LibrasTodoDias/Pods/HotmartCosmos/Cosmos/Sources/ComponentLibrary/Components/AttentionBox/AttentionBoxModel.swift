//
//  AttentionBoxModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 14/07/21.
//

import Foundation

public struct AttentionBoxModel: CosmosModel {
    public var title: String?
    public var description: String
    public var buttonText: String?
    public var style: Style
    public var icon: IconSet
    public var renderStyle: RenderStyle

    public init(
        title: String? = nil,
        description: String,
        buttonText: String? = nil,
        style: Style,
        icon: IconSet,
        renderStyle: RenderStyle = .html
    ) {
        self.title = title
        self.description = description
        self.buttonText = buttonText
        self.style = style
        self.icon = icon
        self.renderStyle = renderStyle
    }

    public enum Style {
        case yellow
        case red
        case green
        case gray
        case blue
        func getSystem() -> SystemAttentionBox {
            let group = AttentionBoxGroup()
            switch self {
            case .yellow:
                return group.yellow
            case .red:
                return group.red
            case .green:
                return group.green
            case .gray:
                return group.gray
            case .blue:
                return group.blue
            }
        }
    }

    public enum RenderStyle {
        case simple
        case html
    }
}

public enum AttentionBoxAction: CosmosAction {
    case didTapButton
}
