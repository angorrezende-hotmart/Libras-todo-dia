//
//  SecondaryBrandColor.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public struct SparkleSecondaryColor: BrandColor, SparkleColors {
    /// DARKER
    public let darker: SystemColor = Darker()

    /// DARK
    public let dark: SystemColor = Dark()

    /// PRIMARY
    public let color: SystemColor = Secondary()

    /// LIGHT
    public let light: SystemColor = Light()

    /// LIGHTER
    public let lighter: SystemColor = Lighter()

    /// LIGHTEST
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `secondary_darker`
        let tokenName: String = "secondary_darker"
        /// `secondary_darker` color
        let color: UIColor = secondaryDarker

        /// Token:  `on_secondary_darker`
        let onColorTokenName: String = "on_secondary_darker"
        /// `on_secondary_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `secondary_dark`
        let tokenName: String = "secondary_dark"
        /// `secondary_dark` color
        let color: UIColor = secondaryDark

        /// Token:  `on_secondary_dark`
        let onColorTokenName: String = "on_secondary_dark"
        /// `on_secondary_dark` color
        let onColor: UIColor = white
    }

    struct Secondary: SystemColor {
        /// Token: `"secondary"`
        let tokenName: String = "secondary"
        /// `"secondary"` color
        let color: UIColor = secondary

        /// Token:  `on_secondary`
        let onColorTokenName: String = "on_secondary"
        /// `on_secondary` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `"secondary_light"`
        let tokenName: String = "secondary_light"
        /// `"secondary_light"` color
        let color: UIColor = secondaryLight

        /// Token:  `on_secondary_light`
        let onColorTokenName: String = "on_secondary_light"
        /// `on_secondary_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `"secondary_lighter"`
        let tokenName: String = "secondary_lighter"
        /// `"secondary_lighter"` color
        let color: UIColor = secondaryLighter

        /// Token:  `on_secondary_lighter`
        let onColorTokenName: String = "on_secondary_lighter"
        /// `on_secondary_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `"secondary_lightest"`
        let tokenName: String = "secondary_lightest"
        /// `"secondary_lightest"` color
        let color: UIColor = secondaryLightest

        /// Token:  `on_secondary_lightest`
        let onColorTokenName: String = "on_secondary_lightest"
        /// `on_secondary_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
