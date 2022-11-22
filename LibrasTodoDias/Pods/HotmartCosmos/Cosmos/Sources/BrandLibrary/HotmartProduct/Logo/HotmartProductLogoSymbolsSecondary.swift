//
//  HotmartProductLogoSymbolsSecondary.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 29/09/22.
//

import Foundation

public struct HotmartProductLogoSymbolsSecondary: LogoSymbols {
    public var symbol: SystemImage = LogoSymbolSecondary()

    public var symbolVariant: SystemImage = LogoSymbolSecondaryVariant()

    public var symbolBlack: SystemImage = LogoSymbolSecondaryBlack()

    public var symbolWhite: SystemImage = LogoSymbolSecondaryWhite()

    struct LogoSymbolSecondary: SystemImage {
        /// Token: `logo_primary`
        let tokenName: String = "hotmart_logo_secondary"
        /// `logo_primary` image
        let image: UIImage = .hotmartLogoSymbolSecondary // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoSymbolSecondaryVariant: SystemImage {
        /// Token: `logo_primary_variant`
        let tokenName: String = "hotmart_logo_secondary_variant"
        /// `logo_primary_variant` image
        let image: UIImage = .hotmartLogoSymbolSecondaryVariant // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoSymbolSecondaryBlack: SystemImage {
        /// Token: `logo_primary_black`
        let tokenName: String = "hotmart_logo_secondary_black"
        /// `logo_primary_black` image
        let image: UIImage = .hotmartLogoSymbolSecondaryBlack // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoSymbolSecondaryWhite: SystemImage {
        /// Token: `logo_primary_white`
        let tokenName: String = "hotmart_logo_secondary_white"
        /// `logo_primary_white` image
        let image: UIImage = .hotmartLogoSymbolSecondaryWhite // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    public init() {}
}
