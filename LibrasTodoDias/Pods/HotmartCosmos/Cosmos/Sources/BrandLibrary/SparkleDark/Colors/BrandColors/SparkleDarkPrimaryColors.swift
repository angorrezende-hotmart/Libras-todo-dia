//
//  SparkleDarkPrimaryColors.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 19/08/21.
//

import Foundation

public struct SparkleDarkPrimaryColors: BrandColor, SparkleDarkColors {
    /// DARKER
    public let darker: SystemColor = Darker()

    /// DARK
    public let dark: SystemColor = Dark()

    /// PRIMARY
    public let color: SystemColor = Primary()

    /// LIGHT
    public let light: SystemColor = Light()

    /// LIGHTER
    public let lighter: SystemColor = Lighter()

    /// LIGHTEST
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `primary_darker`
        let tokenName: String = "primary_darker"
        /// `primary_darker` color
        let color: UIColor = primaryDarker

        /// Token:  `on_primary_darker`
        let onColorTokenName: String = "on_primary_darker"
        /// `on_primary_darker` color
        let onColor: UIColor = primaryLightest
    }

    struct Dark: SystemColor {
        /// Token: `primary_dark`
        let tokenName: String = "primary_dark"
        /// `primary_dark` color
        let color: UIColor = primaryDark

        /// Token:  `on_primary_dark`
        let onColorTokenName: String = "on_primary_dark"
        /// `on_primary_dark` color
        let onColor: UIColor = primaryLightest
    }

    struct Primary: SystemColor {
        /// Token: `"primary"`
        let tokenName: String = "primary"
        /// `"primary"` color
        let color: UIColor = primary

        /// Token:  `on_primary`
        let onColorTokenName: String = "on_primary"
        /// `on_primary` color
        let onColor: UIColor = black
    }

    struct Light: SystemColor {
        /// Token: `"primary_light"`
        let tokenName: String = "primary_light"
        /// `"primary_light"` color
        let color: UIColor = primaryLight

        /// Token:  `on_primary_light`
        let onColorTokenName: String = "on_primary_light"
        /// `on_primary_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `"primary_lighter"`
        let tokenName: String = "primary_lighter"
        /// `"primary_lighter"` color
        let color: UIColor = primaryLighter

        /// Token:  `on_primary_lighter`
        let onColorTokenName: String = "on_primary_lighter"
        /// `on_primary_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `"primary_lightest"`
        let tokenName: String = "primary_lightest"
        /// `"primary_lightest"` color
        let color: UIColor = primaryLightest

        /// Token:  `on_primary_lightest`
        let onColorTokenName: String = "on_primary_lightest"
        /// `on_primary_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}

//
