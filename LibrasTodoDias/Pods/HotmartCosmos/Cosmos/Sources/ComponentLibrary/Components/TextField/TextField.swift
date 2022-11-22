//
//  TextField.swift
//  HotmartCosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 02/07/21.
//

import Foundation

public struct TextField: SystemTextField {
    public var tokenName: String = ""

    public var state: TextFieldModel.State

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
        Cosmos.colors.productColors.neutralProductColor.neutral500
    }

    public var placeholderColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral500
    }

    public var activeColor: SystemColor {
        Cosmos.colors.primaryBrandColor.color
    }

    public var filledColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral500
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

    public var disabledColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral300
    }

    public var textColor: SystemColor {
        switch state {
        case .disabledFilled:
            return Cosmos.colors.productColors.neutralProductColor.neutral300
        default:
            return Cosmos.colors.productColors.neutralProductColor.neutral900
        }
    }

    public var disabledTextColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral500
    }

    public var disabledBackgroundColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral100
    }
}
