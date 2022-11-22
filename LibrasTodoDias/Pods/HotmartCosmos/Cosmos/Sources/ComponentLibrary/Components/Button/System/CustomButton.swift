//
//  CustomButton.swift
//  HotmartCosmos
//
//  Created by Gabriel Lopes Ferreira on 01/09/21.
//

import Foundation

public struct CustomButton: SystemButton {
    public let color: SystemButtonColor = Color()

    public let disabledColor: SystemButtonColor = DisabledColor()

    public let typography: SystemButtonTypography = Typography()

    private struct Color: SystemButtonColor {
        var text: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral100
        }

        var background: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
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

    private struct Typography: SystemButtonTypography {
        var small: SystemTypography {
            Cosmos.typography.body.text1
        }

        var medium: SystemTypography {
            Cosmos.typography.body.text3
        }
    }

    public init() {}
}
