//
//  GreenProductColor.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public struct SparkleGreenColor: ProductColor, SparkleColors {
    /// green_darker
    public let darker: SystemColor = Darker()

    /// green_dark
    public let dark: SystemColor = Dark()

    /// green
    public let color: SystemColor = Green()

    /// green_light
    public let light: SystemColor = Light()

    /// green_lighter
    public let lighter: SystemColor = Lighter()

    /// green_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `green_darker`
        let tokenName: String = "green_darker"
        /// `green_darker` color
        let color: UIColor = greenDarker

        /// Token:  `on_green_darker`
        let onColorTokenName: String = "on_green_darker"
        /// `on_green_darker` color
        let onColor: UIColor = white
    }

    struct Dark: SystemColor {
        /// Token: `green_dark`
        let tokenName: String = "green_dark"
        /// `green_darker` color
        let color: UIColor = greenDark

        /// Token:  `on_green_dark`
        let onColorTokenName: String = "on_green_dark"
        /// `on_green_dark` color
        let onColor: UIColor = white
    }

    struct Green: SystemColor {
        /// Token: `green`
        let tokenName: String = "green"
        /// `green` color
        let color: UIColor = green

        /// Token:  `on_green`
        let onColorTokenName: String = "on_green"
        /// `on_green` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `green_light`
        let tokenName: String = "green_light"
        /// `green_light` color
        let color: UIColor = greenLight

        /// Token:  `on_green_light`
        let onColorTokenName: String = "on_green_light"
        /// `on_green_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `green_lighter`
        let tokenName: String = "green_lighter"
        /// `green_lighter` color
        let color: UIColor = greenLighter

        /// Token:  `on_green_lighter`
        let onColorTokenName: String = "on_green_lighter"
        /// `on_green_lighter` color
        let onColor: UIColor = neutral900
    }

    struct Lightest: SystemColor {
        /// Token: `green_lightest`
        let tokenName: String = "green_lightest"
        /// `green_lightest` color
        let color: UIColor = greenLightest

        /// Token:  `on_green_lightest`
        let onColorTokenName: String = "on_green_lightest"
        /// `on_green_lightest` color
        let onColor: UIColor = neutral900
    }

    public init() {}
}
