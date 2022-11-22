//
//  UIImageAssets.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

// swiftlint:disable force_unwrapping

import UIKit

extension UIImage {
    enum Resource: String {
        case block
        case logoPrimary = "logo_primary"
        case logoPrimaryVariant = "logo_primary_variant"
        case logoPrimaryBlack = "logo_primary_black"
        case logoPrimaryWhite = "logo_primary_white"

        // Hotmart Logo
        case hotmartLogoPrimary = "hotmart_logo_primary"
        case hotmartLogoPrimaryVariant = "hotmart_logo_primary_variant"
        case hotmartLogoPrimaryBlack = "hotmart_logo_primary_black"
        case hotmartLogoPrimaryWhite = "hotmart_logo_primary_white"

        case hotmartLogoSymbol = "hotmart_logo_symbol"
        case hotmartLogoSymbolWhite = "hotmart_logo_symbol_white"
        case hotmartLogoSymbolBlack = "hotmart_logo_symbol_black"

        case hotmartLogoSymbolSecondary = "hotmart_logo_secondary_main"
        case hotmartLogoSymbolSecondaryVariant = "hotmart_logo_secondary_variant"
        case hotmartLogoSymbolSecondaryWhite = "hotmart_logo_secondary_white"
        case hotmartLogoSymbolSecondaryBlack = "hotmart_logo_secondary_black"

        // Hotmart Logo Dark
        case hotmartLogoPrimaryDark = "hotmart_logo_primary_dark"
        case hotmartLogoPrimaryDarkVariant = "hotmart_logo_primary_dark_variant"
        case hotmartLogoPrimaryDarkBlack = "hotmart_logo_primary_dark_black"
        case hotmartLogoPrimaryDarkWhite = "hotmart_logo_primary_dark_white"

        case hotmartLogoDarkSymbol = "hotmart_logo_dark_symbol"
        case hotmartLogoDarkSymbolBlack = "hotmart_logo_dark_symbol_black"
        case hotmartLogoDarkSymbolWhite = "hotmart_logo_dark_symbol_white"

        case hotmartLogoDarkSymbolSecondary = "hotmart_logo_dark_secondary"
        case hotmartLogoDarkSymbolSecondaryVariant = "hotmart_logo_dark_secondary_variant"
        case hotmartLogoDarkSymbolSecondaryWhite = "hotmart_logo_dark_secondary_white"
        case hotmartLogoDarkSymbolSecondaryBlack = "hotmart_logo_dark_secondary_black"

        case logoSymbol = "logo_symbol"
        case logoSymbolWhite = "logo_symbol_white"
        case logoSymbolBlack = "logo_symbol_black"

        case stepperDone = "stepper_done"
        case stepperCurrent = "stepper_current"
        case stepperNext = "stepper_next"
    }

    class var block: UIImage { UIImage(.block)! }
    class var logoPrimary: UIImage { UIImage(.logoPrimary)! }
    class var logoPrimaryVariant: UIImage { UIImage(.logoPrimaryVariant)! }
    class var logoPrimaryBlack: UIImage { UIImage(.logoPrimaryBlack)! }
    class var logoPrimaryWhite: UIImage { UIImage(.logoPrimaryWhite)! }

    // Hotmart Logo
    class var hotmartLogoPrimary: UIImage { UIImage(.hotmartLogoPrimary)! }
    class var hotmartLogoPrimaryVariant: UIImage { UIImage(.hotmartLogoPrimaryVariant)! }
    class var hotmartLogoPrimaryBlack: UIImage { UIImage(.hotmartLogoPrimaryBlack)! }
    class var hotmartLogoPrimaryWhite: UIImage { UIImage(.hotmartLogoPrimaryWhite)! }

    class var hotmartLogoSymbol: UIImage { UIImage(.hotmartLogoSymbol)! }
    class var hotmartLogoSymbolWhite: UIImage { UIImage(.hotmartLogoSymbolWhite)! }
    class var hotmartLogoSymbolBlack: UIImage { UIImage(.hotmartLogoSymbolBlack)! }

    class var hotmartLogoSymbolSecondary: UIImage { UIImage(.hotmartLogoSymbolSecondary)! }
    class var hotmartLogoSymbolSecondaryVariant: UIImage { UIImage(.hotmartLogoSymbolSecondaryVariant)! }
    class var hotmartLogoSymbolSecondaryWhite: UIImage { UIImage(.hotmartLogoSymbolSecondaryWhite)! }
    class var hotmartLogoSymbolSecondaryBlack: UIImage { UIImage(.hotmartLogoSymbolSecondaryBlack)! }

    // Hotmart Logo Dark

    class var hotmartLogoPrimaryDark: UIImage { UIImage(.hotmartLogoPrimaryDark)! }
    class var hotmartLogoPrimaryDarkVariant: UIImage { UIImage(.hotmartLogoPrimaryDarkVariant)! }
    class var hotmartLogoPrimaryDarkBlack: UIImage { UIImage(.hotmartLogoPrimaryDarkBlack)! }
    class var hotmartLogoPrimaryDarkWhite: UIImage { UIImage(.hotmartLogoPrimaryDarkWhite)! }

    class var hotmartLogoDarkSymbol: UIImage { UIImage(.hotmartLogoDarkSymbol)! }
    class var hotmartLogoDarkSymbolBlack: UIImage { UIImage(.hotmartLogoDarkSymbolBlack)! }
    class var hotmartLogoDarkSymbolWhite: UIImage { UIImage(.hotmartLogoDarkSymbolWhite)! }

    class var hotmartLogoDarkSymbolSecondary: UIImage { UIImage(.hotmartLogoDarkSymbolSecondary)! }
    class var hotmartLogoDarkSymbolSecondaryVariant: UIImage { UIImage(.hotmartLogoDarkSymbolSecondaryVariant)! }
    class var hotmartLogoDarkSymbolSecondaryWhite: UIImage { UIImage(.hotmartLogoDarkSymbolSecondaryWhite)! }
    class var hotmartLogoDarkSymbolSecondaryBlack: UIImage { UIImage(.hotmartLogoDarkSymbolSecondaryBlack)! }

    class var logoSymbol: UIImage { UIImage(.logoSymbol)! }
    class var logoSymbolWhite: UIImage { UIImage(.logoSymbolWhite)! }
    class var logoSymbolBlack: UIImage { UIImage(.logoSymbolBlack)! }

    class var stepperDone: UIImage { UIImage(.stepperDone)! }
    class var stepperCurrent: UIImage { UIImage(.stepperCurrent)! }
    class var stepperNext: UIImage { UIImage(.stepperNext)! }

    convenience init?(_ resource: Resource) {
        let moduleBundle: Bundle = .moduleBundle
        self.init(
            named: resource.rawValue,
            in: moduleBundle,
            compatibleWith: nil
        )
    }
}
