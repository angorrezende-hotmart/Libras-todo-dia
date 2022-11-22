//
//  ImageButtonList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 24/06/21.
//

public struct ImageButtonList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_image_button"
    public let tokenName: String = "image_button"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
