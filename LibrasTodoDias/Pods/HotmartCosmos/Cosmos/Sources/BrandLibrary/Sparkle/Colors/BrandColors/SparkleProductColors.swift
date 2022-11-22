//
//  SparkleProductColors.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/22.
//

import Foundation

public struct SparkleProductColors: ProductColors {
    public let neutralProductColor: NeutralColor = SparkleNeutralColors()

    public let blueProductColor: ProductColor = SparkleBlueColor()

    public let cianProductColor: ProductColor = SparkleCianColor()

    public let greenProductColor: ProductColor = SparkleGreenColor()

    public let purpleProductColor: ProductColor = SparklePurpleColor()

    public let redProductColor: ProductColor = SparkleRedColor()

    public let yellowProductColor: ProductColor = SparkleYellowColor()

    public init() {}
}
