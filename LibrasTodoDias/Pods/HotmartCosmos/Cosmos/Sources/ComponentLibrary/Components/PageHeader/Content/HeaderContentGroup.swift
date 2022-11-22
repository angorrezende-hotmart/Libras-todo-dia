//
//  HeaderContentGroup.swift
//  HotmartCosmos-Unit-Tests
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import Foundation

struct HeaderContentGroup: SystemHeaderContentGroup {
    /// Token: `header_desc`
    var headerDesc: SystemHeaderContent = HeaderDesc()
    /// Token: `header_desc_tag`
    var headerDescTag: SystemHeaderContent = HeaderDescTag()

    struct HeaderDesc: SystemHeaderContent {
        let tokenName: String = "header_desc"
        var typography: SystemHeaderContentTypography = HeaderContentTypography()
        var colors: SystemHeaderContentColors = HeaderContentColors()
        var spacing: SystemHeaderContentSpacing = HeaderContentSpacing()

        struct HeaderContentSpacing: SystemHeaderContentSpacing {
            var betweenAvatarAndTitle: CGFloat = Spacing().spacing6.value
            var betweenTitleAndDescription: CGFloat = Spacing().spacing2.value
        }
    }

    struct HeaderDescTag: SystemHeaderContent {
        let tokenName: String = "header_desc_tag"
        var typography: SystemHeaderContentTypography = HeaderContentTypography()
        var colors: SystemHeaderContentColors = HeaderContentColors()
        var spacing: SystemHeaderContentSpacing = HeaderContentSpacing()

        struct HeaderContentSpacing: SystemHeaderContentSpacing {
            var betweenAvatarAndTitle: CGFloat = Spacing().spacing6.value
            var betweenTitleAndDescription: CGFloat = Spacing().spacing3.value
        }
    }

    struct HeaderContentTypography: SystemHeaderContentTypography {
        var title: SystemTypography {
            Cosmos.typography.heading.text6
        }

        var description: SystemTypography {
            Cosmos.typography.body.text2
        }
    }

    struct HeaderContentColors: SystemHeaderContentColors {
        var title: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var description: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }
    }

    public init() {}
}
