//
//  UIFontExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 22/04/21.
//

import Foundation

extension UIFont {
    // MARK: NunitoSans

    /// Returns the font object of kind 'Roboto' in the specified size and weight.
    /// - Parameter fontSize: The size (in points) to which the font is scaled. This value must be greater than 0.0.
    /// - Parameter weight: The weight of the font, specified as a font weight constant. For a list of possible values, see "Font Weights” in UIFontDescriptor. Avoid passing an arbitrary floating-point number for weight, because a font might not include a variant for every weight.
    class func nunitoSans(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        FontLoader.shared.loadFont(named: "NunitoSans-Regular")
        FontLoader.shared.loadFont(named: "NunitoSans-Bold")

        switch weight {
        case .regular:
            return UIFont(name: "NunitoSans-Regular", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .black)
        case .bold:
            return UIFont(name: "NunitoSans-Bold", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .bold)
        default:
            return .systemFont(ofSize: fontSize, weight: weight)
        }
    }

    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: "ttf") else {
            debugPrint("UIFont+:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            debugPrint("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            debugPrint("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            debugPrint("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &errorRef) == false {
            debugPrint("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
}

public extension UIFont.Weight {
    var description: String {
        switch self {
        case .regular:
            return "Regular"
        case .bold:
            return "Bold"
        default:
            return String(describing: self)
        }
    }
}

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: 0)
    }

    func bold() -> UIFont {
        withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        withTraits(traits: .traitItalic)
    }
}
