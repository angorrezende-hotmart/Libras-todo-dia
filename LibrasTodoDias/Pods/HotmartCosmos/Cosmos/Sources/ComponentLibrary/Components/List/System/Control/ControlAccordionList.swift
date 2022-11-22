//
//  ControlAccordionList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

public struct ControlAccordionList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_control_accordion"
    public let tokenName: String = "control_accordion"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing4.value
        let bottomMargin: CGFloat = Spacing().spacing4.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
