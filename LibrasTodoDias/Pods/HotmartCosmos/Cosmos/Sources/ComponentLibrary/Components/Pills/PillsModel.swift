//
//  PillsModel.swift
//  HotmartCosmos
//
//  Created by Rafaela Dutra Nunes on 12/08/21.
//

import Foundation

public struct PillsSectionModel: CosmosModel {
    var sections: [PillsModel]

    public init(
        sections: [PillsModel]
    ) {
        self.sections = sections
    }
}

public struct PillsModel: CosmosModel {
    public var title: String?
    public var items: [PillsItemModel]
    public var orientation: Orientation
    public var allowMultipleSelection: Bool
    public var leadingSpacing: CGFloat

    public init(
        items: [PillsItemModel],
        title: String? = nil,
        orientation: Orientation = .horizontal,
        allowMultipleSelection: Bool,
        leadingSpacing: CGFloat = .zero
    ) {
        self.items = items
        self.title = title
        self.orientation = orientation
        self.allowMultipleSelection = allowMultipleSelection
        self.leadingSpacing = leadingSpacing
    }

    public enum Orientation {
        case horizontal
        case vertical
    }

    public struct Spacing {
        var top: CGFloat
        var left: CGFloat
        var bottom: CGFloat
        var right: CGFloat

        public static var zero: Spacing {
            .init(top: .zero, left: .zero, bottom: .zero, right: .zero)
        }
    }
}

public struct PillsItemModel: CosmosModel {
    var title: String
    var selected: Bool

    public init(
        title: String,
        selected: Bool
    ) {
        self.title = title
        self.selected = selected
    }
}

public enum PillsAction: CosmosAction {
    case selected(index: Int)
    case selectedIndexList(indexes: [Int])
}
