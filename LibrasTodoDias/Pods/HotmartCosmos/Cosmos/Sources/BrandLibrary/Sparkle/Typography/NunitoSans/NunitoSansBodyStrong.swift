//
//  NunitoSansBodyStrong.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public struct NunitoSansBodyStrong: BodyStrongFont {
    public var text0Strong: SystemTypography = Text0Strong()

    public var text1Strong: SystemTypography = Text1Strong()

    public var text2Strong: SystemTypography = Text2Strong()

    public var text3Strong: SystemTypography = Text3Strong()

    public var text4Strong: SystemTypography = Text4Strong()

    struct Text0Strong: SystemTypography {
        /// Size: `10`
        let size: CGFloat = 10
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_0_strong`
        let tokenName: String = "text_0_strong"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `16`
        let lineHeight: CGFloat = 16
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text1Strong: SystemTypography {
        /// Size: `12`
        let size: CGFloat = 12
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_1_strong`
        let tokenName: String = "text_1_strong"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `18`
        let lineHeight: CGFloat = 18
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text2Strong: SystemTypography {
        /// Size: `14`
        let size: CGFloat = 14
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_2_strong`
        let tokenName: String = "text_2_strong"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `20`
        let lineHeight: CGFloat = 20
        /// Letter Spacing: `0.2`
        let letterSpacing: CGFloat = 0.2
    }

    struct Text3Strong: SystemTypography {
        /// Size: `16`
        let size: CGFloat = 16
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_3_strong`
        let tokenName: String = "text_3_strong"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `24`
        let lineHeight: CGFloat = 24
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    struct Text4Strong: SystemTypography {
        /// Size: `18`
        let size: CGFloat = 18
        let fontName: String = "NunitoSans-Bold"
        /// Font: `NunitoSans-Bold`
        var font: UIFont { .nunitoSans(ofSize: size, weight: weight) }
        /// Token: `text_4_strong`
        let tokenName: String = "text_4_strong"
        /// Weight: `bold`
        let weight: UIFont.Weight = .bold
        /// Line Height: `28`
        let lineHeight: CGFloat = 28
        /// Letter Spacing: `0`
        let letterSpacing: CGFloat = 0
    }

    public init() {}
}
