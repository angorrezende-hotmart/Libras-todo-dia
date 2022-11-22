//
//  Toast.swift
//  HotmartCosmos
//
//  Created by Felipe Freitas Vieira Campidelli on 14/03/22.
//

import Foundation

public struct Toast {
    public var textTypography: SystemTypography {
        Cosmos.typography.body.text2
    }

    public var textColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral100
    }

    public var defaultColor: SystemColor {
        Cosmos.colors.productColors.neutralProductColor.neutral900
    }

    public var successColor: SystemColor {
        Cosmos.colors.productColors.greenProductColor.color
    }

    public var warningColor: SystemColor {
        Cosmos.colors.productColors.yellowProductColor.color
    }

    public var dangerColor: SystemColor {
        Cosmos.colors.productColors.redProductColor.color
    }
}
