//
//  Spacing.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 06/05/21.
//

import Foundation

public struct Spacing: SpacingProtocols {
    /// Token: `spacing_9` Size: `56.0`
    public let spacing9: SystemSpacing = Spacing9()

    /// Token: `spacing_8` Size: `40.0`
    public let spacing8: SystemSpacing = Spacing8()

    /// Token: `spacing_7` Size: `32.0`
    public let spacing7: SystemSpacing = Spacing7()

    /// Token: `spacing_6` Size: `24.0`
    public let spacing6: SystemSpacing = Spacing6()

    /// Token: `spacing_5` Size: `20.0`
    public let spacing5: SystemSpacing = Spacing5()

    /// Token: `spacing_4` Size: `16.0`
    public let spacing4: SystemSpacing = Spacing4()

    /// Token: `spacing_3` Size: `12.0`
    public let spacing3: SystemSpacing = Spacing3()

    /// Token: `spacing_2` Size: `8.0`
    public let spacing2: SystemSpacing = Spacing2()

    /// Token: `spacing_1` Size: `4.0`
    public let spacing1: SystemSpacing = Spacing1()

    struct Spacing9: SystemSpacing {
        let tokenName: String = "spacing_9"
        let value: CGFloat = 56.0
    }

    struct Spacing8: SystemSpacing {
        let tokenName: String = "spacing_8"
        let value: CGFloat = 40.0
    }

    struct Spacing7: SystemSpacing {
        let tokenName: String = "spacing_7"
        let value: CGFloat = 32.0
    }

    struct Spacing6: SystemSpacing {
        let tokenName: String = "spacing_6"
        let value: CGFloat = 24.0
    }

    struct Spacing5: SystemSpacing {
        let tokenName: String = "spacing_5"
        let value: CGFloat = 20.0
    }

    struct Spacing4: SystemSpacing {
        let tokenName: String = "spacing_4"
        let value: CGFloat = 16.0
    }

    struct Spacing3: SystemSpacing {
        let tokenName: String = "spacing_3"
        let value: CGFloat = 12.0
    }

    struct Spacing2: SystemSpacing {
        let tokenName: String = "spacing_2"
        let value: CGFloat = 8.0
    }

    struct Spacing1: SystemSpacing {
        let tokenName: String = "spacing_1"
        let value: CGFloat = 4.0
    }

    public init() {}
}
