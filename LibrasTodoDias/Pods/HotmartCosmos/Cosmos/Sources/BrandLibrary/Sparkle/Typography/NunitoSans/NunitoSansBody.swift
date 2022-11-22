//
//  Body.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public struct NunitoSansBody: BodyFont {
    public var text0: SystemTypography = Text0()

    public var text1: SystemTypography = Text1()

    public var text2: SystemTypography = Text2()

    public var text3: SystemTypography = Text3()

    public var text4: SystemTypography = Text4()

    struct Text0: SystemTypography {
        /// Size: `10`
        let size: CGFloat = 10
        /// Font: `NunitoSans-Regular`
        let fontName: String = "NunitoSans-Regular"
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_0`
        let tokenName: String = "text_0"
        /// Weight: `regular`
        let weight: UIFont.Weight = .regular
        /// Line Height: `16`
        let lineHeight: CGFloat = 16
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text1: SystemTypography {
        /// Size: `12`
        let size: CGFloat = 12
        let fontName: String = "NunitoSans-Regular"
        /// Font: `NunitoSans-Regular`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_1`
        let tokenName: String = "text_1"
        /// Weight: `regular`
        let weight: UIFont.Weight = .regular
        /// Line Height: `18`
        let lineHeight: CGFloat = 18
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text2: SystemTypography {
        /// Size: `14`
        let size: CGFloat = 14
        let fontName: String = "NunitoSans-Regular"
        /// Font: `NunitoSans-Regular`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_2`
        let tokenName: String = "text_2"
        /// Weight: `regular`
        let weight: UIFont.Weight = .regular
        /// Line Height: `20`
        let lineHeight: CGFloat = 20
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text3: SystemTypography {
        /// Size: `16`
        let size: CGFloat = 16
        let fontName: String = "NunitoSans-Regular"
        /// Font: `NunitoSans-Regular`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_3`
        let tokenName: String = "text_3"
        /// Weight: `regular`
        let weight: UIFont.Weight = .regular
        /// Line Height: `24`
        let lineHeight: CGFloat = 24
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text4: SystemTypography {
        /// Size: `18`
        let size: CGFloat = 18
        let fontName: String = "NunitoSans-Regular"
        /// Font: `NunitoSans-Regular`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_4`
        let tokenName: String = "text_4"
        /// Weight: `regular`
        let weight: UIFont.Weight = .regular
        /// Line Height: `28`
        let lineHeight: CGFloat = 28
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    public init() {}
}
