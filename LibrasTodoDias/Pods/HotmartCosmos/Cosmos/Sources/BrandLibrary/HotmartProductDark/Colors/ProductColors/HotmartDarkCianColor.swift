//
//  HotmartCianColor.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 30/09/22.
//

import CosmosTokens
import Foundation

public struct HotmartDarkCianColor: ProductColor, SparkleColors {
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
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius600

        /// Token:  `on_cian_darker`
        let onColorTokenName: String = "on_cian_darker"
        /// `on_cian_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `cian_dark`
        let tokenName: String = "cian_dark"
        /// `cian_darker` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius500

        /// Token:  `on_cian_dark`
        let onColorTokenName: String = "on_cian_dark"
        /// `on_cian_dark` color
        let onColor: UIColor = white
    }

    struct Cian: SystemColor {
        /// Token: `cian`
        let tokenName: String = "cian"
        /// `cian` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius400

        /// Token:  `on_cian`
        let onColorTokenName: String = "on_cian"
        /// `on_cian` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `cian_light`
        let tokenName: String = "cian_light"
        /// `cian_light` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius300

        /// Token:  `on_cian_light`
        let onColorTokenName: String = "on_cian_light"
        /// `on_cian_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `cian_lighter`
        let tokenName: String = "cian_lighter"
        /// `cian_lighter` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius200

        /// Token:  `on_cian_lighter`
        let onColorTokenName: String = "on_cian_lighter"
        /// `on_cian_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `cian_lightest`
        let tokenName: String = "cian_lightest"
        /// `cian_lightest` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.sirius100

        /// Token:  `on_cian_lightest`
        let onColorTokenName: String = "on_cian_lightest"
        /// `on_cian_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
