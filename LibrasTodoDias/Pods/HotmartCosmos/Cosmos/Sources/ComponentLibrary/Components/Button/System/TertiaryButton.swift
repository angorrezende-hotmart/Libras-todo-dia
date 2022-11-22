//
//  TertiaryButton.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 10/05/21.
//

import Foundation

public struct TertiaryButton: SystemButton {
    public let color: SystemButtonColor = Color()

    public let disabledColor: SystemButtonColor = DisabledColor()

    public let typography: SystemButtonTypography = Typrography()

    private struct Color: SystemButtonColor {
        var text: SystemColor {
            Cosmos.colors.primaryBrandColor.color
        }

        var background: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.clear
        }

        var border: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.clear
        }
    }

    private struct DisabledColor: SystemButtonColor {
        var text: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral400
        }

        var background: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.clear
        }

        var border: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.clear
        }
    }

    private struct Typrography: SystemButtonTypography {
        var small: SystemTypography {
            Cosmos.typography.body.text1
        }

        var medium: SystemTypography {
            Cosmos.typography.body.text3
        }
    }

    public init() {}
}
