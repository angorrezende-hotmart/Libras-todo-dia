//
//  AttentionBoxGroup.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 14/07/21.
//

import Foundation

public struct AttentionBoxGroup: SystemAttentionBoxGroup {
    /// Color: `yellow_lightest`
    public var yellow: SystemAttentionBox { YellowAttentionBox() }

    /// Color: `red_lightest`
    public var red: SystemAttentionBox = RedAttentionBox()

    /// Color: `green_lightest`
    public var green: SystemAttentionBox = GreenAttentionBox()

    /// Color: `blue_lightest`
    public var blue: SystemAttentionBox = BlueAttentionBox()

    /// Color: `neutral_100`
    public var gray: SystemAttentionBox = GrayAttentionBox()

    struct YellowAttentionBox: SystemAttentionBox {
        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.yellowProductColor.lightest
        }

        var typography: SystemAttentionBoxTypography = BaseTypography()

        var color: SystemAttentionBoxColor = BaseColor()

        var buttonModel: ButtonModel =
            .init(
                title: "",
                style: .default,
                icon: .without,
                size: .small,
                accessibility: nil
            )
    }

    struct RedAttentionBox: SystemAttentionBox {
        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.redProductColor.lightest
        }

        var typography: SystemAttentionBoxTypography = BaseTypography()

        var color: SystemAttentionBoxColor = BaseColor()

        var buttonModel: ButtonModel =
            .init(
                title: "",
                style: .default,
                icon: .without,
                size: .small,
                accessibility: nil
            )
    }

    struct GreenAttentionBox: SystemAttentionBox {
        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.greenProductColor.lightest
        }

        var typography: SystemAttentionBoxTypography = BaseTypography()

        var color: SystemAttentionBoxColor = BaseColor()

        var buttonModel: ButtonModel =
            .init(
                title: "",
                style: .default,
                icon: .without,
                size: .small,
                accessibility: nil
            )
    }

    struct BlueAttentionBox: SystemAttentionBox {
        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.blueProductColor.lightest
        }

        var typography: SystemAttentionBoxTypography = BaseTypography()

        var color: SystemAttentionBoxColor = BaseColor()

        var buttonModel: ButtonModel =
            .init(
                title: "",
                style: .default,
                icon: .without,
                size: .small,
                accessibility: nil
            )
    }

    struct GrayAttentionBox: SystemAttentionBox {
        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral100
        }

        var typography: SystemAttentionBoxTypography = BaseTypography()

        var color: SystemAttentionBoxColor = BaseColor()

        var buttonModel: ButtonModel =
            .init(
                title: "",
                style: .default,
                icon: .without,
                size: .small,
                accessibility: nil
            )
    }

    private struct BaseTypography: SystemAttentionBoxTypography {
        var title: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var description: SystemTypography {
            Cosmos.typography.body.text2
        }
    }

    private struct BaseColor: SystemAttentionBoxColor {
        var title: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var description: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var icon: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }
    }
}
