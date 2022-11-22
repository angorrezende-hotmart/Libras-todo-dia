//
//  HotmartDarkNeutralColor.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 30/09/22.
//
import CosmosTokens
import Foundation

public struct HotmartDarkNeutralColor: NeutralColor, SparkleDarkColors {
    public let black: SystemColor = Black()

    public let neutral900: SystemColor = Neutral900()

    public let neutral800: SystemColor = Neutral800()

    public let neutral700: SystemColor = Neutral700()

    public let neutral600: SystemColor = Neutral600()

    public let neutral500: SystemColor = Neutral500()

    public let neutral400: SystemColor = Neutral400()

    public let neutral300: SystemColor = Neutral300()

    public let neutral200: SystemColor = Neutral200()

    public let neutral100: SystemColor = Neutral100()

    public let white: SystemColor = White()

    public let backgroundPrimary: SystemColor = BackgroundPrimary()

    public let backgroundSecondary: SystemColor = BackgroundSecondary()

    public let backgroundBlur: SystemColor = White()

    public let overlay: SystemColor = Neutral900()

    public let clear: SystemColor = Clear()

    struct Black: SystemColor {
        /// Token: `black`
        let tokenName: String = "black"
        /// `black` color
        let color: UIColor = black

        /// Token:  `on_black`
        let onColorTokenName: String = "on_black"
        /// `on_black` color
        let onColor: UIColor = white
    }

    struct Neutral900: SystemColor {
        /// Token: `neutral_900`
        let tokenName: String = "neutral_900"
        /// `neutral_900` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral900

        /// Token: `on_neutral_900`
        let onColorTokenName: String = "on_neutral_900"
        /// `on_neutral_900` color
        let onColor: UIColor = white
    }

    struct Neutral800: SystemColor {
        /// Token: `neutral_800`
        let tokenName: String = "neutral_800"
        /// `neutral_800` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral800

        /// Token: `on_neutral_800`
        let onColorTokenName: String = "on_neutral_800"
        /// `on_neutral_800` color
        let onColor: UIColor = white
    }

    struct Neutral700: SystemColor {
        /// Token: `neutral_700`
        let tokenName: String = "neutral_700"
        /// `neutral_700` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral700

        /// Token: `on_neutral_700`
        let onColorTokenName: String = "on_neutral_700"
        /// `on_neutral_700` color
        let onColor: UIColor = white
    }

    struct Neutral600: SystemColor {
        /// Token: `neutral_600`
        let tokenName: String = "neutral_600"
        /// `neutral_600` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral600

        /// Token: `on_neutral_600`
        let onColorTokenName: String = "on_neutral_600"
        /// `on_neutral_600` color
        let onColor: UIColor = white
    }

    struct Neutral500: SystemColor {
        /// Token: `neutral_500`
        let tokenName: String = "neutral_500"
        /// `neutral_500` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral500

        /// Token: `on_neutral_500`
        let onColorTokenName: String = "on_neutral_500"
        /// `on_neutral_500` color
        let onColor: UIColor = white
    }

    struct Neutral400: SystemColor {
        /// Token: `neutral_400`
        let tokenName: String = "neutral_400"
        /// `neutral_400` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral400

        /// Token: `on_neutral_400`
        let onColorTokenName: String = "on_neutral_400"
        /// `on_neutral_400` color
        let onColor: UIColor = white
    }

    struct Neutral300: SystemColor {
        /// Token: `neutral_300`
        let tokenName: String = "neutral_300"
        /// `neutral_300` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral300

        /// Token: `on_neutral_300`
        let onColorTokenName: String = "on_neutral_300"
        /// `on_neutral_300` color
        let onColor: UIColor = white
    }

    struct Neutral200: SystemColor {
        /// Token: `neutral_200`
        let tokenName: String = "neutral_200"
        /// `neutral_200` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral200

        /// Token: `on_neutral_200`
        let onColorTokenName: String = "on_neutral_200"
        /// `on_neutral_200` color
        let onColor: UIColor = white
    }

    struct Neutral100: SystemColor {
        /// Token: `neutral_100`
        let tokenName: String = "neutral_100"
        /// `neutral_100` color
        let color: UIColor = HotmartProductDarkStyleDictionaryColor.neutral100

        /// Token: `on_neutral_100`
        let onColorTokenName: String = "on_neutral_100"
        /// `on_neutral_100` color
        let onColor: UIColor = white
    }

    struct White: SystemColor {
        /// Token: `white`
        let tokenName: String = "white"
        /// `white` color
        let color: UIColor = white

        /// Token: `on_white`
        let onColorTokenName: String = "on_white"
        /// `on_white` color
        let onColor: UIColor = neutral900
    }

    struct BackgroundPrimary: SystemColor {
        /// Token: `background_primary`
        let tokenName: String = "background_primary"
        /// `bacgkroundPrimary` color
        let color: UIColor = bacgkroundPrimary

        /// Token:  `on_background_primary`
        let onColorTokenName: String = "on_background_primary"
        /// `on_background_primary` color
        let onColor: UIColor = white
    }

    struct BackgroundSecondary: SystemColor {
        /// Token: `background_secondary`
        let tokenName: String = "background_secondary"
        /// `bacgkroundPrimary` color
        let color: UIColor = bacgkroundSecondary

        /// Token:  `on_background_secondary`
        let onColorTokenName: String = "on_background_secondary"
        /// `on_background_secondary` color
        let onColor: UIColor = white
    }

    struct BackgroundBlur: SystemColor {
        /// Token: `background_blur`
        let tokenName: String = "background_blur"
        /// `background_blur` color
        let color: UIColor = bacgkroundBlur

        /// Token:  `on_background_blur`
        let onColorTokenName: String = "background_blur"
        /// `on_background_blur` color
        let onColor: UIColor = white
    }

    struct Clear: SystemColor {
        /// Token: `clear`
        let tokenName: String = "clear"
        /// `clear` color
        let color: UIColor = .clear

        /// Token: `on_white`
        let onColorTokenName: String = "on_clear"
        /// `clear` color
        let onColor: UIColor = .clear
    }

    public init() {}
}
