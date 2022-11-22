//
//  SectionHeaderGroup.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

struct SectionHeaderGroup: SystemSectionHeaderGroup {
    /// Token: `sec_header`
    let secHeader: SystemSectionHeader = SecHeader()

    /// Token: `sec_header_desc`
    let secHeaderDesc: SystemSectionHeader = SecHeaderDesc()

    /// Token: `sec_header_action`
    let secHeaderAction: SystemSectionHeader = SecHeaderAction()

    /// Token: `sec_header_action_desc`
    let secHeaderActionDesc: SystemSectionHeader = SecHeaderActionDesc()

    private struct SecHeader: SystemSectionHeader {
        /// Token: `sec_header`
        let tokenName: String = "sec_header"

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var disabledColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }

        let subtitleTypography: SystemTypography? = nil

        let buttonTypography: SystemTypography? = nil

        let subtitleColor: SystemColor? = nil

        let buttonColor: SystemColor? = nil
    }

    private struct SecHeaderDesc: SystemSectionHeader {
        /// Token: `sec_header_desc`
        let tokenName: String = "sec_header_desc"

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var subtitleTypography: SystemTypography? {
            Cosmos.typography.body.text1
        }

        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var subtitleColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var disabledColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }

        let buttonTypography: SystemTypography? = nil

        let buttonColor: SystemColor? = nil
    }

    private struct SecHeaderAction: SystemSectionHeader {
        /// Token: `sec_header_action`
        let tokenName: String = "sec_header_action"

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var buttonTypography: SystemTypography? {
            Cosmos.typography.body.text1
        }

        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var buttonColor: SystemColor? {
            Cosmos.colors.primaryBrandColor.color
        }

        var disabledColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }

        let subtitleTypography: SystemTypography? = nil

        let subtitleColor: SystemColor? = nil
    }

    private struct SecHeaderActionDesc: SystemSectionHeader {
        /// Token: `sec_header_action_desc`
        let tokenName: String = "sec_header_action_desc"

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var subtitleTypography: SystemTypography? {
            Cosmos.typography.body.text1
        }

        var buttonTypography: SystemTypography? {
            Cosmos.typography.body.text1
        }

        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var subtitleColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var buttonColor: SystemColor? {
            Cosmos.colors.primaryBrandColor.color
        }

        var disabledColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral300
        }
    }
}
