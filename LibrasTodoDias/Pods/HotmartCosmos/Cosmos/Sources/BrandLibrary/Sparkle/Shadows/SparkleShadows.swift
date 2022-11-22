//
//  SparkleShadowSmall.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 29/04/21.
//

import UIKit

public struct SparkleShadows: SystemShadows {
    public var small: SystemShadow = ShadowSmall()

    public var medium: SystemShadow = ShadowMedium()

    public var large: SystemShadow = ShadowLarge()

    struct ShadowSmall: SystemShadow {
        /// Token: `box_shadow_sm`
        let tokenName: String = "box_shadow_sm"
        /// Shadow Color: `black`
        let color: UIColor = .black
        /// Shadow Opacity: `0.1`
        let opacity: Float = 0.1
        /// Shadow Offset: `0 , 3`
        let offset: CGSize = .init(width: 0, height: 3)
        /// Shadow Radius: `8`
        let radius: CGFloat = 8
    }

    struct ShadowMedium: SystemShadow {
        /// Token: `box_shadow_md`
        let tokenName: String = "box_shadow_md"
        /// Shadow Color: `black`
        let color: UIColor = .black
        /// Shadow Opacity: `0.1`
        let opacity: Float = 0.15
        /// Shadow Offset: `0 , 8`
        let offset: CGSize = .init(width: 0, height: 8)
        /// Shadow Radius: `16`
        let radius: CGFloat = 16
    }

    struct ShadowLarge: SystemShadow {
        /// Token: `box_shadow_lg`
        let tokenName: String = "box_shadow_lg"
        /// Shadow Color: `black`
        let color: UIColor = .black
        /// Shadow Opacity: `0.1`
        let opacity: Float = 0.2
        /// Shadow Offset: `0 , 16`
        let offset: CGSize = .init(width: 0, height: 16)
        /// Shadow Radius: `32`
        let radius: CGFloat = 32
    }

    public func allShadows() -> [SystemShadow] {
        [
            small,
            medium,
            large,
        ]
    }

    public init() {}
}
