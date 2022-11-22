//
//  SparkleDarkProductColors.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/22.
//

import Foundation

public struct SparkleDarkProductColors: ProductColors {
    public let neutralProductColor: NeutralColor = SparkleDarkNeutralColors()

    public let blueProductColor: ProductColor = SparkleDarkBlueColor()

    public let cianProductColor: ProductColor = SparkleDarkCianColor()

    public let greenProductColor: ProductColor = SparkleDarkGreenColor()

    public let purpleProductColor: ProductColor = SparkleDarkPurpleColor()

    public let redProductColor: ProductColor = SparkleDarkRedColor()

    public let yellowProductColor: ProductColor = SparkleDarkYellowColor()

    public init() {}
}
