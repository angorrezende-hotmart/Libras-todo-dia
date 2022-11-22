//
//  HotmartProductLogoDark.swift
//  HotmartCosmos
//
//  Created by Daniel Faria Rocha on 03/10/22.
//

import Foundation

public struct HotmartProductLogoDark: LogoPrimary {
    public var primary: SystemImage = LogoPrimary()

    public var primaryVariant: SystemImage = LogoPrimaryVariant()

    public var primaryBlack: SystemImage = LogoPrimaryBlack()

    public var primaryWhite: SystemImage = LogoPrimaryWhite()

    struct LogoPrimary: SystemImage {
        /// Token: `logo_primary`
        let tokenName: String = "hotmart_logo_primary"
        /// `logo_primary` image
        let image: UIImage = .hotmartLogoPrimaryDark // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryVariant: SystemImage {
        /// Token: `logo_primary_variant`
        let tokenName: String = "hotmart_logo_primary_variant"
        /// `logo_primary_variant` image
        let image: UIImage = .hotmartLogoPrimaryDarkVariant // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryBlack: SystemImage {
        /// Token: `logo_primary_black`
        let tokenName: String = "hotmart_logo_primary_black"
        /// `logo_primary_black` image
        let image: UIImage = .hotmartLogoPrimaryDarkBlack // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryWhite: SystemImage {
        /// Token: `logo_primary_white`
        let tokenName: String = "hotmart_logo_primary_white"
        /// `logo_primary_white` image
        let image: UIImage = .hotmartLogoPrimaryDarkWhite // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    public init() {}
}
