//
//  HotmartBlueColor.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 29/09/22.
//

import CosmosTokens
import Foundation

public struct HotmartBlueColor: ProductColor, SparkleColors {
    /// blue_darker
    public let darker: SystemColor = Darker()

    /// blue_dark
    public let dark: SystemColor = Dark()

    /// blue
    public let color: SystemColor = Blue()

    /// blue_light
    public let light: SystemColor = Light()

    /// blue_lighter
    public let lighter: SystemColor = Lighter()

    /// blue_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `blue_darker`
        let tokenName: String = "blue_darker"
        /// `blue_darker` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info600

        /// Token:  `on_blue_darker`
        let onColorTokenName: String = "on_blue_darker"
        /// `on_blue_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `blue_dark`
        let tokenName: String = "blue_dark"
        /// `blue_darker` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info500

        /// Token:  `on_blue_dark`
        let onColorTokenName: String = "on_blue_dark"
        /// `on_blue_dark` color
        let onColor: UIColor = white
    }

    struct Blue: SystemColor {
        /// Token: `blue`
        let tokenName: String = "blue"
        /// `blue` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info400

        /// Token:  `on_blue`
        let onColorTokenName: String = "on_blue"
        /// `on_blue` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `blue_light`
        let tokenName: String = "blue_light"
        /// `blue_light` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info300

        /// Token:  `on_blue_light`
        let onColorTokenName: String = "on_blue_light"
        /// `on_blue_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `blue_lighter`
        let tokenName: String = "blue_lighter"
        /// `blue_lighter` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info200

        /// Token:  `on_blue_lighter`
        let onColorTokenName: String = "on_blue_lighter"
        /// `on_blue_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `blue_lightest`
        let tokenName: String = "blue_lightest"
        /// `blue_lightest` color
        let color: UIColor = HotmartProductBaseStyleDictionaryColor.info100

        /// Token:  `on_blue_lightest`
        let onColorTokenName: String = "on_blue_lightest"
        /// `on_blue_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
