//
//  BoderRadius.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import Foundation

public struct BorderRadiusGroup: SystemBorderRadiusGroup {
    /// Token: `radius_md` Value: `8.0`
    public let small: SystemBorderRadius = Small()

    /// Token: `radius_md` Value: `16.0`
    public let medium: SystemBorderRadius = Medium()

    public init() {}

    struct Small: SystemBorderRadius {
        /// Token: `radius_sm`
        let tokenName: String = "radius_sm"
        /// Value: `8.0`
        let value: CGFloat = 8.0
    }

    struct Medium: SystemBorderRadius {
        /// Token: `radius_md`
        let tokenName: String = "radius_md"
        /// Value: `16.0`
        let value: CGFloat = 16.0
    }
}
