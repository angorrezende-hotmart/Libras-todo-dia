//
//  CianProductColor.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 05/04/21.
//

import Foundation

public struct SparkleCianColor: ProductColor, SparkleColors {
    /// cian_darker
    public let darker: SystemColor = Darker()

    /// cian_dark
    public let dark: SystemColor = Dark()

    /// cian
    public let color: SystemColor = Cian()

    /// cian_light
    public let light: SystemColor = Light()

    /// cian_lighter
    public let lighter: SystemColor = Lighter()

    /// cian_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `cian_darker`
        let tokenName: String = "cian_darker"
        /// `cian_darker` color
        let color: UIColor = cianDarker

        /// Token:  `on_cian_darker`
        let onColorTokenName: String = "on_cian_darker"
        /// `on_cian_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `cian_dark`
        let tokenName: String = "cian_dark"
        /// `cian_darker` color
        let color: UIColor = cianDark

        /// Token:  `on_cian_dark`
        let onColorTokenName: String = "on_cian_dark"
        /// `on_cian_dark` color
        let onColor: UIColor = white
    }

    struct Cian: SystemColor {
        /// Token: `cian`
        let tokenName: String = "cian"
        /// `cian` color
        let color: UIColor = cian

        /// Token:  `on_cian`
        let onColorTokenName: String = "on_cian"
        /// `on_cian` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `cian_light`
        let tokenName: String = "cian_light"
        /// `cian_light` color
        let color: UIColor = cianLight

        /// Token:  `on_cian_light`
        let onColorTokenName: String = "on_cian_light"
        /// `on_cian_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `cian_lighter`
        let tokenName: String = "cian_lighter"
        /// `cian_lighter` color
        let color: UIColor = cianLighter

        /// Token:  `on_cian_lighter`
        let onColorTokenName: String = "on_cian_lighter"
        /// `on_cian_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `cian_lightest`
        let tokenName: String = "cian_lightest"
        /// `cian_lightest` color
        let color: UIColor = cianLightest

        /// Token:  `on_cian_lightest`
        let onColorTokenName: String = "on_cian_lightest"
        /// `on_cian_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
