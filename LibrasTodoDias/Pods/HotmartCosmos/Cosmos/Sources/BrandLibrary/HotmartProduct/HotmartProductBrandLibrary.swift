//
//  HotmartProductBrandLibrary.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 28/09/22.
//

import Foundation

public struct HotmartProductBrandLibrary: BrandLibrary {
    public let tokenName: String = "hotmart_product_brand_library"

    public let typography: FontFamily = NunitoSans()

    public let logo: LogoPrimary = HotmartProductLogo()

    public var logoSymbolsSecondary: LogoSymbols = HotmartProductLogoSymbolsSecondary()

    public let logoSymbols: LogoSymbols = HotmartProductLogoSymbols()

    public let colors: BrandLibraryColors = HotmartColors()

    public let systemTheme: SystemTheme = .light

    struct HotmartColors: BrandLibraryColors {
        let primaryBrandColor: BrandColor = HotmartPrimaryColor()

        let secondaryBrandColor: BrandColor = HotmartSecondaryColor()

        let productColors: ProductColors = HotmartProductColors()
    }

    public init() {}
}
