//
//  ControlButtonList.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 15/07/21.
//

public struct ControlButtonList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_control_button"
    public let tokenName: String = "control_button"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing4.value
        let bottomMargin: CGFloat = Spacing().spacing4.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
