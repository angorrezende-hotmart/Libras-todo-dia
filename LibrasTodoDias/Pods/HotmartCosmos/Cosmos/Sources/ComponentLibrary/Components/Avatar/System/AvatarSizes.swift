//
//  SparkleAvatarSizes.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/04/21.
//

import Foundation

public struct AvatarSizes: AvatarSizesProtocol {
    /// Token: `avatar_xe` Size: `96.0` Font: `heading_9`
    public let xe: AvatarSizeProtocol = XE()

    /// Token: `avatar_xl` Size: `72.0` Font: `heading_6`
    public let xl: AvatarSizeProtocol = XL()

    /// Token: `avatar_lg` Size: `56.0` Font: `text_4`
    public let lg: AvatarSizeProtocol = LG()

    /// Token: `avatar_md` Size: `48.0` Font: `text_3`
    public let md: AvatarSizeProtocol = MD()

    /// Token: `avatar_sm` Size: `40.0` Font: `text_2`
    public let sm: AvatarSizeProtocol = SM()

    /// Token: `avatar_xs` Size: `32.0` Font: `text_1`
    public let xs: AvatarSizeProtocol = XS()

    /// Token: `avatar_xxs` Size: `16.0` Font: `text_1`
    public let xxs: AvatarSizeProtocol = XXS()

    // MARK: - Sizes Declaration

    struct XE: AvatarSizeProtocol {
        let sizeValue: CGFloat = 96.0
        let iconSize: CGFloat = 56.0
        let sizeStyles: AvatarSize = .xe
        let tokenName: String = "avatar_xe"
        var systemFont: SystemTypography {
            Cosmos.typography.heading.text9
        }
    }

    struct XL: AvatarSizeProtocol {
        let sizeValue: CGFloat = 72.0
        let iconSize: CGFloat = 32.0
        let sizeStyles: AvatarSize = .xl
        let tokenName: String = "avatar_xl"
        var systemFont: SystemTypography {
            Cosmos.typography.heading.text6
        }
    }

    struct LG: AvatarSizeProtocol {
        let sizeValue: CGFloat = 56.0
        let iconSize: CGFloat = 24.0
        let sizeStyles: AvatarSize = .lg
        let tokenName: String = "avatar_lg"
        var systemFont: SystemTypography {
            Cosmos.typography.body.text4
        }
    }

    struct MD: AvatarSizeProtocol {
        let sizeValue: CGFloat = 48.0
        let iconSize: CGFloat = 24.0
        let sizeStyles: AvatarSize = .md
        let tokenName: String = "avatar_md"
        var systemFont: SystemTypography {
            Cosmos.typography.body.text3
        }
    }

    struct SM: AvatarSizeProtocol {
        let sizeValue: CGFloat = 40.0
        let iconSize: CGFloat = 20.0
        let sizeStyles: AvatarSize = .sm
        let tokenName: String = "avatar_sm"
        var systemFont: SystemTypography {
            Cosmos.typography.body.text2
        }
    }

    struct XS: AvatarSizeProtocol {
        let sizeValue: CGFloat = 32.0
        let iconSize: CGFloat = 16.0
        let sizeStyles: AvatarSize = .xs
        let tokenName: String = "avatar_xs"
        var systemFont: SystemTypography {
            Cosmos.typography.body.text1
        }
    }

    struct XXS: AvatarSizeProtocol {
        let sizeValue: CGFloat = 16.0
        let iconSize: CGFloat = 8.0
        let sizeStyles: AvatarSize = .xxs
        let tokenName: String = "avatar_xxs"
        var systemFont: SystemTypography {
            Cosmos.typography.body.text1
        }
    }

    // MARK: - Public Init

    public init() {}

    // MARK: - Public Methods

    public func getForSize(_ size: AvatarSize) -> AvatarSizeProtocol {
        switch size {
        case .xe:
            return xe
        case .xl:
            return xl
        case .lg:
            return lg
        case .md:
            return md
        case .sm:
            return sm
        case .xs:
            return xs
        case .xxs:
            return xxs
        }
    }

    public func getToken(_ tokenName: String) -> Token? {
        guard let size = AvatarSize(rawValue: tokenName) else {
            return nil
        }

        return getForSize(size)
    }
}
