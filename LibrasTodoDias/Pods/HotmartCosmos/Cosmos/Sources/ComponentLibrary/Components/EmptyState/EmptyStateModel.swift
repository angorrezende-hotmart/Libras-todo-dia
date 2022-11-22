//
//  EmptyStateModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 04/11/21.
//

import Foundation

public struct EmptyStateModel: CosmosModel {
    public var title: String
    public var description: String?
    public var image: UIImage?
    public var illustration: UIImage?
    public var style: Style

    public init(
        title: String,
        description: String? = nil,
        image: UIImage? = nil,
        illustration: UIImage? = nil,
        style: Style
    ) {
        self.title = title
        self.description = description
        self.image = image
        self.illustration = illustration
        self.style = style
    }

    public enum Style {
        case basic
        case actions(firstButton: ButtonModel, secondButton: ButtonModel? = nil)

        public func getSystem() -> SystemEmptyState {
            let group = EmptyStatesGroup()
            switch self {
            case .basic:
                return group.basic
            case .actions:
                return group.actions
            }
        }
    }
}

public enum EmptyStateAction {
    case firstButtonTap
    case secondButtonTap
}
