//
//  SparkleTheme.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public struct SparkleBrandLibrary: BrandLibrary {
    public let tokenName: String = "sparkle_brand_library"

    public let typography: FontFamily = NunitoSans()

    public let logo: LogoPrimary = SparkleLogo()

    public var logoSymbolsSecondary: LogoSymbols = SparkleLogoSymbols()

    public let logoSymbols: LogoSymbols = SparkleLogoSymbols()

    public let colors: BrandLibraryColors = SparkleColors()

    public let systemTheme: SystemTheme = .light

    struct SparkleColors: BrandLibraryColors {
        let primaryBrandColor: BrandColor = SparklePrimaryColor()

        let secondaryBrandColor: BrandColor = SparkleSecondaryColor()

        let productColors: ProductColors = SparkleProductColors()
    }

    public init() {}
}
