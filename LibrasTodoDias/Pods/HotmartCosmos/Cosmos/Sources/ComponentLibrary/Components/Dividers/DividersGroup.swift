//
//  Dividers.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 25/05/21.
//

import Foundation
import UIKit

public struct DividersGroup: SystemDividers {
    /// Token: `divider_middle`
    public var middle: SystemDivider = DividerMiddle()
    /// Token: `divider_fullBleed`
    public var fullBleed: SystemDivider = DividerFullBleed()

    struct DividerMiddle: SystemDivider {
        let tokenName: String = "divider_middle"
        let lineHeight: CGFloat = 1.0
        let horizontalSpacing: CGFloat = 20.0
        let verticalSpacing: CGFloat = 24.0
        var color: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral200.color
        }
    }

    struct DividerFullBleed: SystemDivider {
        let tokenName: String = "divider_fullBleed"
        let lineHeight: CGFloat = 1.0
        let horizontalSpacing: CGFloat = 0.0
        let verticalSpacing: CGFloat = 24.0
        var color: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral200.color
        }
    }

    public init() {}
}
