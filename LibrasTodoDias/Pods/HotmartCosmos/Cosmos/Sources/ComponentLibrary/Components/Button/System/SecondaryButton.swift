//
//  SecondaryButton.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import Foundation

public struct SecondaryButton: SystemButton {
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
            Cosmos.colors.primaryBrandColor.color
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
            Cosmos.colors.productColors.neutralProductColor.neutral200
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
