//
//  LogoSymbols.swift
//  CosmosInterface
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public protocol LogoSymbols: ImageGroup {
    var symbol: SystemImage { get }
    var symbolWhite: SystemImage { get }
    var symbolBlack: SystemImage { get }
    var symbolVariant: SystemImage { get }
}

public extension LogoSymbols {
    func allImages() -> [SystemImage] {
        [
            symbol,
            symbolWhite,
            symbolBlack,
            symbolVariant,
        ]
    }
}
