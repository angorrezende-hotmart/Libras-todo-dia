//
//  ImageControlList.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 22/12/21.
//

import Foundation

public struct ImageControlList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_image"
    public let tokenName: String = "image_control"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
