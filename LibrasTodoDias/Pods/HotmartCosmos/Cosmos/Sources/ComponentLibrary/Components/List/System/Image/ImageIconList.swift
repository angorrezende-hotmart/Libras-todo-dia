//
//  ImageList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

public struct ImageIconList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_image_icon"
    public let tokenName: String = "image_icon"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = Spacing().spacing2.value
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
