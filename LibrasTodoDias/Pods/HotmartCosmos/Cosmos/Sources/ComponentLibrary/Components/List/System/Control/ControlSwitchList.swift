//
//  ControlSwitchList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

public struct ControlSwitchList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_control_switch"
    public let tokenName: String = "control_switch"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
