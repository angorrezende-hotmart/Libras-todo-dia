//
//  HotmartProductDarkBrandLibrary.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 30/09/22.
//

import Foundation

public struct HotmartProductDarkBrandLibrary: BrandLibrary {
    public let tokenName: String = "hotmart_product_brand_library"

    public let typography: FontFamily = NunitoSans()

    public let logo: LogoPrimary = HotmartProductLogoDark()

    public var logoSymbolsSecondary: LogoSymbols = HotmartProductLogoDarkSymbolsSecondary()

    public let logoSymbols: LogoSymbols = HotmartProductLogoDarkSymbols()

    public let colors: BrandLibraryColors = HotmartDarkColors()

    public let systemTheme: SystemTheme = .dark

    struct HotmartDarkColors: BrandLibraryColors {
        let primaryBrandColor: BrandColor = HotmartDarkPrimaryColor()

        let secondaryBrandColor: BrandColor = HotmartDarkSecondaryColor()

        let productColors: ProductColors = HotmartDarkProductkColors()
    }

    public init() {}
}
