//
//  SectionHeadeModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

public struct SectionHeaderModel: CosmosModel {
    var title: String
    var subtitle: String?
    var buttonTitle: String?
    var icon: IconSet
    var style: Style
    var disabled: Bool

    public init(
        title: String,
        subtitle: String? = nil,
        buttonTitle: String? = nil,
        icon: IconSet = .arrowForward,
        style: Style,
        disabled: Bool = false
    ) {
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.icon = icon
        self.style = style
        self.disabled = disabled
    }

    func getSystem() -> SystemSectionHeader {
        let headerGroup = SectionHeaderGroup()

        switch style {
        case .header:
            return headerGroup.secHeader
        case .headerDescription:
            return headerGroup.secHeaderDesc
        case .headerAction:
            return headerGroup.secHeaderAction
        case .headerDescriptionAction:
            return headerGroup.secHeaderActionDesc
        }
    }

    public enum Style {
        case header
        case headerDescription
        case headerAction
        case headerDescriptionAction
    }
}

public enum SectionHeaderAction: CosmosAction {
    case viewMore
}
