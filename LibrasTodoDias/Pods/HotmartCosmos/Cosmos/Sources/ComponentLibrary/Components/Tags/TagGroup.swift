//
//  TagGroup.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

struct TagGroup: SystemTagGroup {
    /// Token: `tag_gray`
    let gray: SystemTag = Gray()

    /// Token: `tag_gray_check`
    let grayIcon: SystemTag = Gray()

    /// Token: `tag_green`
    let green: SystemTag = Green()

    /// Token: `tag_green_check`
    let greenIcon: SystemTag = Green()

    /// Token: `tag_yellow`
    let yellow: SystemTag = Yellow()

    /// Token: `tag_yellow_check`
    let yellowIcon: SystemTag = Yellow()

    /// Token: `tag_red`
    let red: SystemTag = Red()

    /// Token: `tag_red_check`
    let redIcon: SystemTag = Red()

    /// Token: `tag_disabled`
    let disabled: SystemTag = Disabled()

    private struct Gray: SystemTag {
        let tokenName: String = "tag_gray"

        var typography: SystemTypography {
            Cosmos.typography.body.text1
        }

        var textColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral200
        }
    }

    private struct Green: SystemTag {
        let tokenName: String = "tag_green"

        var typography: SystemTypography {
            Cosmos.typography.body.text1
        }

        var textColor: SystemColor {
            Cosmos.colors.productColors.greenProductColor.darker
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.greenProductColor.lightest
        }
    }

    private struct Yellow: SystemTag {
        let tokenName: String = "tag_yellow"

        var typography: SystemTypography {
            Cosmos.typography.body.text1
        }

        var textColor: SystemColor {
            Cosmos.colors.productColors.yellowProductColor.darker
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.yellowProductColor.lightest
        }
    }

    private struct Red: SystemTag {
        let tokenName: String = "tag_red"

        var typography: SystemTypography {
            Cosmos.typography.body.text1
        }

        var textColor: SystemColor {
            Cosmos.colors.productColors.redProductColor.darker
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.redProductColor.lightest
        }
    }

    private struct Disabled: SystemTag {
        let tokenName: String = "tag_disabled"

        var typography: SystemTypography {
            Cosmos.typography.body.text1
        }

        var textColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral100
        }
    }
}
