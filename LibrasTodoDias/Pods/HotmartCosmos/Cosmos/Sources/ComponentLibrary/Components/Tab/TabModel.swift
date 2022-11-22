//
//  TabModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/06/21s.
//

import Foundation

public struct TabModel: CosmosModel {
    var items: [TabItemModel]
    var widthStyle: WidhtStyle

    public init(
        items: [TabItemModel],
        widthStyle: WidhtStyle = .fixed
    ) {
        self.items = items
        self.widthStyle = widthStyle
    }

    public enum WidhtStyle {
        case fixed
        case adaptable
    }
}

public struct TabItemModel: CosmosModel {
    var title: String
    var icon: UIImage?
    var iconYPositioning: CGFloat?
    var indicator: Bool
    var selected: Bool

    public init(
        title: String,
        icon: UIImage? = nil,
        iconYPositioning: CGFloat? = .zero,
        indicator: Bool = false,
        selected: Bool = false
    ) {
        self.title = title
        self.icon = icon
        self.iconYPositioning = iconYPositioning
        self.indicator = indicator
        self.selected = selected
    }
}

public enum TabAction: CosmosAction {
    case tab(index: Int, title: String)
}
