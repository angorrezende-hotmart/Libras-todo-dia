//
//  PaginationGroup.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 27/01/22.
//

import Foundation

struct PaginationGroup: SystemPaginationGroup {
    /// Token: `pag_default`
    var `default`: SystemPagination = DefaultPagination()

    /// Token: `pag_white`
    var white: SystemPagination = WhitePagination()

    /// Token: `pag_black`
    var black: SystemPagination = BlackPagination()

    private struct DefaultPagination: SystemPagination {
        let tokenName: String = "pag_default"

        var defaultColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral200
        }

        var activeColor: SystemColor {
            Cosmos.colors.primaryBrandColor.color
        }
    }

    private struct WhitePagination: SystemPagination {
        let tokenName: String = "pag_white"

        var defaultColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.white
        }

        var activeColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.white
        }
    }

    private struct BlackPagination: SystemPagination {
        let tokenName: String = "pag_black"

        var defaultColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }

        var activeColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }
    }
}
