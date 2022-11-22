//
//  HotmartProductColors.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 29/09/22.
//

import Foundation

public struct HotmartProductColors: ProductColors {
    public let neutralProductColor: NeutralColor = HotmartNeutralColor()

    public let blueProductColor: ProductColor = HotmartBlueColor()

    public let cianProductColor: ProductColor = HotmartCianColor()

    public let greenProductColor: ProductColor = HotmartGreenColor()

    public let purpleProductColor: ProductColor = HotmartPurpleColor()

    public let redProductColor: ProductColor = HotmartRedColor()

    public let yellowProductColor: ProductColor = HotmartYellowColor()

    public init() {}
}
