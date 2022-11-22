//
//  CardDescriptionGroup.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

struct CardDescriptionGroup {
    /// Token Name: `card_desc_1`
    let desc1: SystemCardDescripton = CardDesc1()

    /// Token Name: `card_desc_2`
    let desc2: SystemCardDescripton = CardDesc1()

    /// Token Name: `card_desc_3`
    let desc3: SystemCardDescripton = CardDesc3()

    /// Token Name: `card_desc_4`
    let desc4: SystemCardDescripton = CardDesc4()

    /// Token Name: `card_desc_5`
    let desc5: SystemCardDescripton = CardDesc5()

    /// Token Name: `card_desc_6`
    let desc6: SystemCardDescripton = CardDesc6()

    /// Token Name: `card_desc_7`
    let desc7: SystemCardDescripton = CardDesc7()

    /// Token Name: `card_desc_8
    let desc8: SystemCardDescripton = CardDesc8()

    /// Token Name: `card_desc_9`
    let desc9: SystemCardDescripton = CardDesc9()

    // MARK: - Struct Declaration

    private struct CardDesc1: SystemCardDescripton {
        /// Token Name: `card_desc_1`
        let tokenName: String = "card_desc_1"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Not used
        let priceTypography: SystemTypography? = nil
        /// Not used
        let priceColor: SystemColor? = nil
        /// Not used
        let promotionTypography: SystemTypography? = nil
        /// Not used
        let promotionColor: SystemColor? = nil
        /// Not used
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc2: SystemCardDescripton {
        /// Token Name: `card_desc_2`
        let tokenName: String = "card_desc_2"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Not used
        let priceTypography: SystemTypography? = nil
        /// Not used
        let priceColor: SystemColor? = nil
        /// Not used
        let promotionTypography: SystemTypography? = nil
        /// Not used
        let promotionColor: SystemColor? = nil
        /// Not used
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc3: SystemCardDescripton {
        /// Token Name: `card_desc_3`
        let tokenName: String = "card_desc_3"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Not used
        let priceTypography: SystemTypography? = nil
        /// Not used
        let priceColor: SystemColor? = nil
        /// Not used
        let promotionTypography: SystemTypography? = nil
        /// Not used
        let promotionColor: SystemColor? = nil
        /// Not used
        var buttonModel: ButtonModel? = ButtonModel(
            title: "Secondary",
            style: .secondary,
            icon: .without,
            size: .small,
            accessibility: nil
        )
    }

    private struct CardDesc4: SystemCardDescripton {
        /// Token Name: `card_desc_4`
        let tokenName: String = "card_desc_4"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Pri
        var priceTypography: SystemTypography? {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var priceColor: SystemColor? {
            Cosmos.colors.productColors.greenProductColor.color
        }

        /// Not used
        let promotionTypography: SystemTypography? = nil
        /// Not used
        let promotionColor: SystemColor? = nil
        /// Not used
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc5: SystemCardDescripton {
        /// Token Name: `card_desc_5`
        let tokenName: String = "card_desc_5"

        /// Title Typography: `text_1_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text1Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Pri
        var priceTypography: SystemTypography? {
            Cosmos.typography.body.text2
        }

        var priceColor: SystemColor? {
            Cosmos.colors.productColors.neutralProductColor.neutral500
        }

        var promotionTypography: SystemTypography? {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var promotionColor: SystemColor? {
            Cosmos.colors.productColors.greenProductColor.color
        }

        /// Not used
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc6: SystemCardDescripton {
        /// Token Name: `card_desc_6`
        let tokenName: String = "card_desc_6"

        /// Title Typography: `text_1`
        var titleTypography: SystemTypography {
            Cosmos.typography.body.text1
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Title Typography: `text_2_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Not used

        let priceTypography: SystemTypography? = nil
        let priceColor: SystemColor? = nil
        let promotionTypography: SystemTypography? = nil
        let promotionColor: SystemColor? = nil
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc7: SystemCardDescripton {
        /// Token Name: `card_desc_7
        let tokenName: String = "card_desc_7"

        /// Title Typography: `text_1`
        var titleTypography: SystemTypography {
            Cosmos.typography.body.text1
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Title Typography: `text_2_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Not used

        let priceTypography: SystemTypography? = nil
        let priceColor: SystemColor? = nil
        let promotionTypography: SystemTypography? = nil
        let promotionColor: SystemColor? = nil
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc8: SystemCardDescripton {
        /// Token Name: `card_desc_8
        let tokenName: String = "card_desc_8"

        /// Title Typography: `text_1`
        var titleTypography: SystemTypography {
            Cosmos.typography.body.text1
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Title Typography: `text_2_strong`
        var authorTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        /// Title Color: `neutral_900`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var priceTypography: SystemTypography? {
            Cosmos.typography.bodyStrong.text3Strong
        }

        var priceColor: SystemColor? {
            Cosmos.colors.productColors.greenProductColor.color
        }

        /// Not used

        let promotionTypography: SystemTypography? = nil
        let promotionColor: SystemColor? = nil
        let buttonModel: ButtonModel? = nil
    }

    private struct CardDesc9: SystemCardDescripton {
        /// Token Name: `card_desc_9
        let tokenName: String = "card_desc_9"

        /// Title Typography: `text_2_strong`
        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        /// Title Color: `neutral_900`
        var titleColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        /// Title Typography: `text_1`
        var authorTypography: SystemTypography {
            Cosmos.typography.body.text1
        }

        /// Title Color: `neutral_600`
        var authorColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        /// Not used
        let priceTypography: SystemTypography? = nil
        let priceColor: SystemColor? = nil
        let promotionTypography: SystemTypography? = nil
        let promotionColor: SystemColor? = nil
        let buttonModel: ButtonModel? = nil
    }

    // MARK: - Public Init

    public init() {}
}
