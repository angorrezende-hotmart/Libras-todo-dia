//
//  CTAButton.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 10/05/21.
//

import Foundation

public struct CTAButton: SystemButton {
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
            Cosmos.colors.productColors.greenProductColor.color
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
