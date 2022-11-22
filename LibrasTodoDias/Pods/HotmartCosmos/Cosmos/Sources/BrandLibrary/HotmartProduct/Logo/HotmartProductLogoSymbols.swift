//
//  HotmartProductLogoSymbols.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 28/09/22.
//

import Foundation

public struct HotmartProductLogoSymbols: LogoSymbols {
    public var symbol: SystemImage = LogoSymbol()

    public var symbolWhite: SystemImage = SymbolWhite()

    public var symbolBlack: SystemImage = SymbolBlack()

    public var symbolVariant: SystemImage = SymbolVariant()

    struct LogoSymbol: SystemImage {
        /// Token: `logo_symbol`
        let tokenName: String = "hotmart_logo_symbol"
        /// `logo_symbol` image
        var image: UIImage = .hotmartLogoSymbol // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct SymbolWhite: SystemImage {
        /// Token: `logo_symbol_white`
        let tokenName: String = "hotmart_logo_symbol_white"
        /// `logo_symbol_white` image
        var image: UIImage = .hotmartLogoSymbolWhite // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct SymbolBlack: SystemImage {
        /// Token: `logo_symbol_black`
        let tokenName: String = "hotmart_logo_symbol_black"
        /// `logo_symbol_black` image
        var image: UIImage = .hotmartLogoSymbolBlack // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct SymbolVariant: SystemImage {
        /// Token: `logo_symbol_white`
        let tokenName: String = "hotmart_logo_symbol_variant"
        /// `logo_symbol_white` image
        var image: UIImage = .hotmartLogoSymbolWhite // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    public init() {}
}
