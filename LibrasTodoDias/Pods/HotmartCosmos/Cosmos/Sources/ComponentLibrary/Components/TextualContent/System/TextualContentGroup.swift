//
//  TextualContentGroup.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

struct TextualContentGroup {
    /// Token Name: `list_desc_1`
    let listDesc1: SystemTextualContent = ListDesc1()

    /// Token Name: `list_desc_2`
    let listDesc2: SystemTextualContent = ListDesc2()

    // MARK: - Struct Declaration

    private struct ListDesc1: SystemTextualContent {
        /// Token Name: `list_desc_1`
        let tokenName: String = "list_desc_1"

        /// Title Typography: `text_3`
        var titleTypography: SystemTypography {
            Cosmos.typography.body.text3
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Not used
        let descriptionTypography: SystemTypography? = nil
        /// Not used
        let descriptionColor: SystemColor? = nil
    }

    private struct ListDesc2: SystemTextualContent {
        /// Token Name: `list_desc_2`
        let tokenName: String = "list_desc_2"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Description Typography: `text_1`
        var descriptionTypography: SystemTypography? {
            Cosmos.typography.body.text1
        }

        /// Description Color: `neutral_600`
        var descriptionColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }
    }
}
