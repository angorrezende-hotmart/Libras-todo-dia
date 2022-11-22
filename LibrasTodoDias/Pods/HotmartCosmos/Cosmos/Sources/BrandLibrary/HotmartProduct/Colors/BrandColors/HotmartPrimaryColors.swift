//
//  HotmartPrimaryColors.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 28/09/22.
//

import CosmosTokens
import Foundation

public struct HotmartPrimaryColor: BrandColor, SparkleColors {
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
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary600

        /// Token:  `on_primary_darker`
        let onColorTokenName: String = "on_primary_darker"
        /// `on_primary_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `primary_dark`
        let tokenName: String = "primary_dark"
        /// `primary_dark` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary500

        /// Token:  `on_primary_dark`
        let onColorTokenName: String = "on_primary_dark"
        /// `on_primary_dark` color
        let onColor: UIColor = white
    }

    struct Primary: SystemColor {
        /// Token: `"primary"`
        let tokenName: String = "primary"
        /// `"primary"` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary400

        /// Token:  `on_primary`
        let onColorTokenName: String = "on_primary"
        /// `on_primary` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `"primary_light"`
        let tokenName: String = "primary_light"
        /// `"primary_light"` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary300

        /// Token:  `on_primary_light`
        let onColorTokenName: String = "on_primary_light"
        /// `on_primary_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `"primary_lighter"`
        let tokenName: String = "primary_lighter"
        /// `"primary_lighter"` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary200

        /// Token:  `on_primary_lighter`
        let onColorTokenName: String = "on_primary_lighter"
        /// `on_primary_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `"primary_lightest"`
        let tokenName: String = "primary_lightest"
        /// `"primary_lightest"` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.primary100

        /// Token:  `on_primary_lightest`
        let onColorTokenName: String = "on_primary_lightest"
        /// `on_primary_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
