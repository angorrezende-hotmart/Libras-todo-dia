//
//  ControlActionLeftRightList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

public struct ControlActionLeftRightList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_control_action_lr"
    public let tokenName: String = "control_action_lr"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = Spacing().spacing2.value
        let trailingMargin: CGFloat = Spacing().spacing2.value
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing2.value
    }
}
