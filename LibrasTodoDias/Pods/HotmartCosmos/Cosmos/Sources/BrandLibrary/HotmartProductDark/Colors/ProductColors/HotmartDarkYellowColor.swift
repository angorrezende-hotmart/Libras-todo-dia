//
//  HotmartDarkYellowColors.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 30/09/22.
//

import CosmosTokens
import Foundation

public struct HotmartDarkYellowColor: ProductColor, SparkleColors {
    /// yellow_darker
    public let darker: SystemColor = Darker()

    /// yellow_dark
    public let dark: SystemColor = Dark()

    /// yellow
    public let color: SystemColor = Yellow()

    /// yellow_light
    public let light: SystemColor = Light()

    /// yellow_lighter
    public let lighter: SystemColor = Lighter()

    /// yellow_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `yellow_darker`
        let tokenName: String = "yellow_darker"
        /// `yellow_darker` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning600

        /// Token:  `on_yellow_darker`
        let onColorTokenName: String = "on_yellow_darker"
        /// `on_yellow_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `yellow_dark`
        let tokenName: String = "yellow_dark"
        /// `yellow_darker` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning500

        /// Token:  `on_yellow_dark`
        let onColorTokenName: String = "on_yellow_dark"
        /// `on_yellow_dark` color
        let onColor: UIColor = white
    }

    struct Yellow: SystemColor {
        /// Token: `yellow`
        let tokenName: String = "yellow"
        /// `yellow` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning400

        /// Token:  `on_yellow`
        let onColorTokenName: String = "on_yellow"
        /// `on_yellow` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `yellow_light`
        let tokenName: String = "yellow_light"
        /// `yellow_light` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning300

        /// Token:  `on_yellow_light`
        let onColorTokenName: String = "on_yellow_light"
        /// `on_yellow_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `yellow_lighter`
        let tokenName: String = "yellow_lighter"
        /// `yellow_lighter` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning200

        /// Token:  `on_yellow_lighter`
        let onColorTokenName: String = "on_yellow_lighter"
        /// `on_yellow_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `yellow_lightest`
        let tokenName: String = "yellow_lightest"
        /// `yellow_lightest` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.warning100

        /// Token:  `on_yellow_lightest`
        let onColorTokenName: String = "on_yellow_lightest"
        /// `on_yellow_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
