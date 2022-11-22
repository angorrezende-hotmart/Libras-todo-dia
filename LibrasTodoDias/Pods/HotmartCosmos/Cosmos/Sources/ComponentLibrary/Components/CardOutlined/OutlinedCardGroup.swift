//
//  OutlinedCardGroup.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 12/11/21.
//

import Foundation

struct OutlinedCardGroup: SystemOutlinedCardGroup {
    var `default`: SystemOutlinedCard = DefaultOutlinedCard()
    var shortAction: SystemOutlinedCard = ShortActionOutlinedCard()

    struct DefaultOutlinedCard: SystemOutlinedCard {
        var tokenName: String = "card_outlined_df"
        var sizes: SystemOutlinedCardSizes = OutlinedCardSizes()
        var metrics: SystemOutlinedCardMetrics = Metrics()
        var typography: SystemOutlinedCardTypography = OutlinedCardTypography()
        var colors: SystemOutlinedCardColor = OutlinedCardColor()

        struct Metrics: SystemOutlinedCardMetrics {
            var strokeSize: CGFloat = 1.0
            var cornerRadius: CGFloat = BorderRadiusGroup().small.value
            var contentSpacing: CGFloat = Spacing().spacing3.value
            var spacingBetweenIconAndTitle: CGFloat = Spacing().spacing3.value
            var spacingBetweenTitleAndDescription: CGFloat = Spacing().spacing1.value
        }
    }

    struct ShortActionOutlinedCard: SystemOutlinedCard {
        var tokenName: String = "card_outlined_sa"
        var sizes: SystemOutlinedCardSizes = OutlinedCardSizes()
        var metrics: SystemOutlinedCardMetrics = Metrics()
        var typography: SystemOutlinedCardTypography = OutlinedCardTypography()
        var colors: SystemOutlinedCardColor = OutlinedCardColor()

        struct Metrics: SystemOutlinedCardMetrics {
            var strokeSize: CGFloat = 1.0
            var cornerRadius: CGFloat = BorderRadiusGroup().small.value
            var contentSpacing: CGFloat = Spacing().spacing3.value
            var spacingBetweenIconAndTitle: CGFloat = Spacing().spacing5.value
            var spacingBetweenTitleAndDescription: CGFloat = Spacing().spacing1.value
        }
    }

    struct OutlinedCardTypography: SystemOutlinedCardTypography {
        var title: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var description: SystemTypography {
            Cosmos.typography.body.text1
        }
    }

    struct OutlinedCardColor: SystemOutlinedCardColor {
        var icon: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var title: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var description: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var background: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
        }

        var stroke: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral200
        }
    }
}

struct OutlinedCardSizes: SystemOutlinedCardSizes {
    var small: SystemOutlinedCardSize = Small()
    var medium: SystemOutlinedCardSize = Medium()
    var big: SystemOutlinedCardSize = Big()
    var flex: SystemOutlinedCardSize = Flex()

    struct Small: SystemOutlinedCardSize {
        var width: CGFloat = 140.0
    }

    struct Medium: SystemOutlinedCardSize {
        var width: CGFloat = 156.0
    }

    struct Big: SystemOutlinedCardSize {
        var width: CGFloat = 212.0
    }

    struct Flex: SystemOutlinedCardSize {
        var width: CGFloat = .zero
    }

    public func getForSize(_ size: OutlinedCardSize) -> SystemOutlinedCardSize {
        switch size {
        case .small:
            return small
        case .medium:
            return medium
        case .big:
            return big
        case .flex:
            return flex
        }
    }
}
