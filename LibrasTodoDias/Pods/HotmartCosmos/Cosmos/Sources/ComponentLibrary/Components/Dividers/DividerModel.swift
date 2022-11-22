//
//  DividerModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 28/05/21.
//

import Foundation

public struct DividerModel: CosmosModel {
    public var style: Style
    public var hasVerticalSpacing: Bool

    public init(
        style: Style,
        hasVerticalSpacing: Bool
    ) {
        self.style = style
        self.hasVerticalSpacing = hasVerticalSpacing
    }

    public enum Style {
        case middle
        case fullBleed

        public func getSystem() -> SystemDivider {
            let dividersGroup = DividersGroup()
            switch self {
            case .middle:
                return dividersGroup.middle
            case .fullBleed:
                return dividersGroup.fullBleed
            }
        }
    }
}
