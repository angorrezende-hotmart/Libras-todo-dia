//
//  AlertModel.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 31/05/21.
//
import Foundation

public struct AlertModel: CosmosModel {
    public var title: String?
    public var description: String?
    public var style: Style

    public init(
        title: String?,
        description: String?,
        style: Style
    ) {
        self.title = title
        self.description = description
        self.style = style
    }

    public enum Style {
        case alert
        case actionSheet

        public func getSystem() -> SystemAlert {
            let alertsGroup = AlertsGroup()
            switch self {
            case .alert:
                return alertsGroup.alert
            case .actionSheet:
                return alertsGroup.actionSheet
            }
        }
    }
}
