//
//  HeaderPlatesGroup.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 22/10/21.
//

import Foundation

struct HeaderPlatesGroup: SystemHeaderPlatesGroup {
    /// Token: `header_plates`
    var headerPlates: SystemHeaderPlates = HeaderPlates()

    struct HeaderPlates: SystemHeaderPlates {
        let tokenName: String = "header_plates"
        var typography: SystemHeaderPlatesTypography = HeaderPlatesTypography()
        var colors: SystemHeaderPlatesColors = HeaderPlatesColors()
        var spacing: SystemHeaderPlatesSpacing = HeaderPlatesSpacing()
        var sizes: SystemHeaderPlatesSizes = HeaderPlatesSizes()
    }

    struct HeaderPlatesTypography: SystemHeaderPlatesTypography {
        var name: SystemTypography {
            Cosmos.typography.body.text2
        }
    }

    struct HeaderPlatesColors: SystemHeaderPlatesColors {
        var icon: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var name: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }
    }

    struct HeaderPlatesSpacing: SystemHeaderPlatesSpacing {
        var betweenPlates: CGFloat = 12.0
        var leadingAndTrailing: CGFloat = 18.0
    }

    struct HeaderPlatesSizes: SystemHeaderPlatesSizes {
        var icon: ImageSize = .large
    }

    public init() {}
}
