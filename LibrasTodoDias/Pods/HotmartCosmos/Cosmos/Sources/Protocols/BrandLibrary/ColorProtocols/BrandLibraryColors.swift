//
//  BrandLibraryColors.swift
//  CosmosInterface
//
//  Created by Rafael Lage Moreira Barbosa on 27/04/21.
//

import Foundation

public protocol BrandLibraryColors {
    var primaryBrandColor: BrandColor { get }
    var secondaryBrandColor: BrandColor { get }
    var productColors: ProductColors { get }
}

public protocol ProductColors {
    var neutralProductColor: NeutralColor { get }
    var blueProductColor: ProductColor { get }
    var cianProductColor: ProductColor { get }
    var greenProductColor: ProductColor { get }
    var purpleProductColor: ProductColor { get }
    var redProductColor: ProductColor { get }
    var yellowProductColor: ProductColor { get }
}
