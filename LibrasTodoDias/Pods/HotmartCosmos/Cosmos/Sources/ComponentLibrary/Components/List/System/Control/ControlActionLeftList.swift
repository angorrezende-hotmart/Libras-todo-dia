//
//  ControlActionList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct ControlActionLeftList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_control_action_l"
    public let tokenName: String = "control_action_l"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing4.value
        let bottomMargin: CGFloat = Spacing().spacing4.value
        let leadingMargin: CGFloat = Spacing().spacing4.value
        let trailingMargin: CGFloat = Spacing().spacing2.value
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
