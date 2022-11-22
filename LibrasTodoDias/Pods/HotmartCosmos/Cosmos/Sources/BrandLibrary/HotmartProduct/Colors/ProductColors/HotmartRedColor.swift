//
//  HotmartRedColor.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 29/09/22.
//

import CosmosTokens
import Foundation

public struct HotmartRedColor: ProductColor, SparkleColors {
    /// red_darker
    public let darker: SystemColor = Darker()

    /// red_dark
    public let dark: SystemColor = Dark()

    /// red
    public let color: SystemColor = Red()

    /// red_light
    public let light: SystemColor = Light()

    /// red_lighter
    public let lighter: SystemColor = Lighter()

    /// red_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `red_darker`
        let tokenName: String = "red_darker"
        /// `red_darker` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger600

        /// Token:  `on_red_darker`
        let onColorTokenName: String = "on_red_darker"
        /// `on_red_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `red_dark`
        let tokenName: String = "red_dark"
        /// `red_darker` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger500

        /// Token:  `on_red_dark`
        let onColorTokenName: String = "on_red_dark"
        /// `on_red_dark` color
        let onColor: UIColor = white
    }

    struct Red: SystemColor {
        /// Token: `red`
        let tokenName: String = "red"
        /// `red` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger400

        /// Token:  `on_red`
        let onColorTokenName: String = "on_red"
        /// `on_red` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `red_light`
        let tokenName: String = "red_light"
        /// `red_light` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger300

        /// Token:  `on_red_light`
        let onColorTokenName: String = "on_red_light"
        /// `on_red_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `red_lighter`
        let tokenName: String = "red_lighter"
        /// `red_lighter` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger200

        /// Token:  `on_red_lighter`
        let onColorTokenName: String = "on_red_lighter"
        /// `on_red_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `red_lightest`
        let tokenName: String = "red_lightest"
        /// `red_lightest` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.danger100

        /// Token:  `on_red_lightest`
        let onColorTokenName: String = "on_red_lightest"
        /// `on_red_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
