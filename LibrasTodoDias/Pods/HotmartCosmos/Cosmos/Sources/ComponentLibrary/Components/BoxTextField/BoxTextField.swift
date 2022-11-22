//
//  BoxTextField.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 10/12/21.
//

import Foundation

public struct BoxTextField: SystemBoxTextField {
    public var tokenName: String = ""

    public var labelTypography: SystemTypography {
        Cosmos.typography.body.text1
    }

    public var placeholderTypography: SystemTypography {
        Cosmos.typography.body.text3
    }

    public var textTypography: SystemTypography {
        Cosmos.typography.bodyStrong.text3Strong
    }

    public var descriptionTypography: SystemTypography {
        Cosmos.typography.body.text0
    }

    public var defaultColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral200
    }

    public var placeholderColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral500
    }

    public var activeColor: SystemColor {
        Cosmos.colors.primaryBrandColor.color
    }

    public var filledColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral200
    }

    public var successColor: SystemColor {
        Cosmos.colors.productColors.greenProductColor.color
    }

    public var warningColor: SystemColor {
        Cosmos.colors.productColors.yellowProductColor.dark
    }

    public var errorColor: SystemColor {
        Cosmos.colors.productColors.redProductColor.color
    }

    public var textColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral900
    }

    public var disabledTextColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral300
    }

    public var defaultTextColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral500
    }

    public var disabledColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral300
    }

    public var defaultBackgroundColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.clear
    }

    public var activeBackgroundColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
    }

    public var disabledBackgroundColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral100
    }
}
