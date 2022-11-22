//
//  NunitoSansHeading.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public struct NunitoSansHeading: HeadingFont {
    public var text5: SystemTypography = Text5()

    public var text6: SystemTypography = Text6()

    public var text7: SystemTypography = Text7()

    public var text8: SystemTypography = Text8()

    public var text9: SystemTypography = Text9()

    public var text10: SystemTypography = Text10()

    struct Text5: SystemTypography {
        /// Size: `20`
        let size: CGFloat = 20
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_5`
        let tokenName: String = "text_5"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `24`
        let lineHeight: CGFloat = 24
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text6: SystemTypography {
        /// Size: `24`
        let size: CGFloat = 24
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_6`
        let tokenName: String = "text_6"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `28`
        let lineHeight: CGFloat = 28
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text7: SystemTypography {
        /// Size: `28`
        let size: CGFloat = 28
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_7`
        let tokenName: String = "text_7"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `32`
        let lineHeight: CGFloat = 32
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text8: SystemTypography {
        /// Size: `32`
        let size: CGFloat = 32
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_8`
        let tokenName: String = "text_8"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `36`
        let lineHeight: CGFloat = 36
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text9: SystemTypography {
        /// Size: `36`
        let size: CGFloat = 36
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_9`
        let tokenName: String = "text_9"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `44`
        let lineHeight: CGFloat = 44
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text10: SystemTypography {
        /// Size: `40`
        let size: CGFloat = 40
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_10`
        let tokenName: String = "text_10"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `48`
        let lineHeight: CGFloat = 48
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    public init() {}
}
