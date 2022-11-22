//
//  SparkleDarkBrandLibrary.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 19/08/21.
//

import Foundation

public struct SparkleDarkBrandLibrary: BrandLibrary {
    public let tokenName: String = "sparkle_dark_brand_library"

    public let typography: FontFamily = NunitoSans()

    public let logo: LogoPrimary = SparkleLogo()

    public var logoSymbolsSecondary: LogoSymbols = SparkleLogoSymbols()

    public let logoSymbols: LogoSymbols = SparkleLogoSymbols()

    public let colors: BrandLibraryColors = SparkleDarkColors()

    public let systemTheme: SystemTheme = .dark

    struct SparkleDarkColors: BrandLibraryColors {
        let primaryBrandColor: BrandColor = SparkleDarkPrimaryColors()

        let secondaryBrandColor: BrandColor = SparkleDarkSecondaryColor()

        let productColors: ProductColors = SparkleDarkProductColors()
    }

    public init() {}
}
