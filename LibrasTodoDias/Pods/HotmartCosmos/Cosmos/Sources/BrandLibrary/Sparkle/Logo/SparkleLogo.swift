//
//  SparkleLogo.swift
//  CosmosInterface
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

/*

 Use swiftgen? Or not?

 Maybe use swiftgen, or at least create a extension like we use in Sparkle Modules

 */

import Foundation

public struct SparkleLogo: LogoPrimary {
    public var primary: SystemImage = LogoPrimary()

    public var primaryVariant: SystemImage = LogoPrimaryVariant()

    public var primaryBlack: SystemImage = LogoPrimaryBlack()

    public var primaryWhite: SystemImage = LogoPrimaryWhite()

    struct LogoPrimary: SystemImage {
        /// Token: `logo_primary`
        let tokenName: String = "logo_primary"
        /// `logo_primary` image
        let image: UIImage = .logoPrimary // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryVariant: SystemImage {
        /// Token: `logo_primary_variant`
        let tokenName: String = "logo_primary_variant"
        /// `logo_primary_variant` image
        let image: UIImage = .logoPrimaryVariant // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryBlack: SystemImage {
        /// Token: `logo_primary_black`
        let tokenName: String = "logo_primary_black"
        /// `logo_primary_black` image
        let image: UIImage = .logoPrimaryBlack // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    struct LogoPrimaryWhite: SystemImage {
        /// Token: `logo_primary_white`
        let tokenName: String = "logo_primary_white"
        /// `logo_primary_white` image
        let image: UIImage = .logoPrimaryWhite // Not final, maybe use swiftgen, or at least create a extension like we use in Sparkle Modules
    }

    public init() {}
}
