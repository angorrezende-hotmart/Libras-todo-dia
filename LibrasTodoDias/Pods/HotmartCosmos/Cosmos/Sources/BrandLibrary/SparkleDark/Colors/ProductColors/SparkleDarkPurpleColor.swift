//
//  SparkleDarkPurpleColor.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 26/08/21.
//

import Foundation

public struct SparkleDarkPurpleColor: ProductColor, SparkleDarkColors {
    /// purple_darker
    public let darker: SystemColor = Darker()

    /// purple_dark
    public let dark: SystemColor = Dark()

    /// purple
    public let color: SystemColor = Purple()

    /// purple_light
    public let light: SystemColor = Light()

    /// purple_lighter
    public let lighter: SystemColor = Lighter()

    /// purple_lightest
    public let lightest: SystemColor = Lightest()

    struct Darker: SystemColor {
        /// Token: `purple_darker`
        let tokenName: String = "purple_darker"
        /// `purple_darker` color
        let color: UIColor = purpleDarker

        /// Token:  `on_purple_darker`
        let onColorTokenName: String = "on_purple_darker"
        /// `on_purple_darker` color
        let onColor: UIColor = purpleLighter
    }

    struct Dark: SystemColor {
        /// Token: `purple_dark`
        let tokenName: String = "purple_dark"
        /// `purple_darker` color
        let color: UIColor = purpleDark

        /// Token:  `on_purple_dark`
        let onColorTokenName: String = "on_purple_dark"
        /// `on_purple_dark` color
        let onColor: UIColor = purpleLightest
    }

    struct Purple: SystemColor {
        /// Token: `purple`
        let tokenName: String = "purple"
        /// `purple` color
        let color: UIColor = purple

        /// Token:  `on_purple`
        let onColorTokenName: String = "on_purple"
        /// `on_purple` color
        let onColor: UIColor = white
    }

    struct Light: SystemColor {
        /// Token: `purple_light`
        let tokenName: String = "purple_light"
        /// `purple_light` color
        let color: UIColor = purpleLight

        /// Token:  `on_purple_light`
        let onColorTokenName: String = "on_purple_light"
        /// `on_purple_light` color
        let onColor: UIColor = neutral900
    }

    struct Lighter: SystemColor {
        /// Token: `purple_lighter`
        let tokenName: String = "purple_lighter"
        /// `purple_lighter` color
        let color: UIColor = purpleLighter

        /// Token:  `on_purple_lighter`
        let onColorTokenName: String = "on_purple_lighter"
        /// `on_purple_lighter` color
        let onColor: UIColor = purpleDarker
    }

    struct Lightest: SystemColor {
        /// Token: `purple_lightest`
        let tokenName: String = "purple_lightest"
        /// `purple_lightest` color
        let color: UIColor = purpleLightest

        /// Token:  `on_purple_lightest`
        let onColorTokenName: String = "on_purple_lightest"
        /// `on_purple_lightest` color
        let onColor: UIColor = purpleDarker
    }

    public init() {}
}
