//
//  DefaultLeftIconTagList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct DefaultLeftIconTagList: SystemList {
    public let margins: SystemListMargins = Margins()
    /// Token: "list_default_licon_tag"
    public let tokenName: String = "default_licon_tag"

    private struct Margins: SystemListMargins {
        let topMargin: CGFloat = Spacing().spacing3.value
        let bottomMargin: CGFloat = Spacing().spacing3.value
        let leadingMargin: CGFloat = 18.0
        let trailingMargin: CGFloat = 18.0
        let horizontalSpacingBetweenItems: CGFloat = Spacing().spacing4.value
    }
}
