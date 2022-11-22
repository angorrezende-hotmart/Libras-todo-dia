//
//  TagModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

public struct TagModel: CosmosModel {
    var text: String
    var style: Style
    var icon: IconSet?
    var textStyle: TextStyle

    public init(
        text: String,
        style: Style,
        icon: IconSet? = nil,
        textStyle: TextStyle = .html
    ) {
        self.text = text
        self.style = style
        self.icon = icon
        self.textStyle = textStyle
    }

    public enum Style {
        case gray
        case green
        case yellow
        case red
        case disabled
        func getName() -> String {
            switch self {
            case .gray:
                return "gray"
            case .green:
                return "green"
            case .yellow:
                return "yellow"
            case .red:
                return "red"
            case .disabled:
                return "disabled"
            }
        }
    }

    public enum TextStyle {
        case simple
        case html
    }

    func getSystem() -> SystemTag {
        let tagGroup = TagGroup()
        switch style {
        case .gray:
            return tagGroup.gray
        case .green:
            return tagGroup.green
        case .yellow:
            return tagGroup.yellow
        case .red:
            return tagGroup.red
        case .disabled:
            return tagGroup.disabled
        }
    }

    public func getTokenName() -> String {
        style.getName()
    }
}
