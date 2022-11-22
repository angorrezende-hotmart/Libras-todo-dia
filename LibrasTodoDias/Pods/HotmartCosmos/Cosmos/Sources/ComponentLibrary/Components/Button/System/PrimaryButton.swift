//
//  ButtonGroup.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import Foundation

public struct PrimaryButton: SystemButton {
    public let color: SystemButtonColor = Color()

    public let disabledColor: SystemButtonColor = DisabledColor()

    public let typography: SystemButtonTypography = Typography()

    private struct Typography: SystemButtonTypography {
        var small: SystemTypography {
            Cosmos.typography.body.text1
        }

        var medium: SystemTypography {
            Cosmos.typography.body.text3
        }
    }

    private struct Color: SystemButtonColor {
        var text: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.white
        }

        var background: SystemColor {
            Cosmos.colors.primaryBrandColor.color
        }

        let border: SystemColor? = nil
    }

    private struct DisabledColor: SystemButtonColor {
        var text: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral400
        }

        var background: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral100
        }

        let border: SystemColor? = nil
    }

    public init() {}
}
