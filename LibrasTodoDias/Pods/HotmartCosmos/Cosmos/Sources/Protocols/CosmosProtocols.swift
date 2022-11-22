//
//  CosmosProtocols.swift
//  Pods
//
//  Created by Rafael Lage Moreira Barbosa on 18/03/21.
//

import UIKit

public protocol Token {
    /// The actual token name
    var tokenName: String { get }
}

// Or tokenGroup ??!?!?!
public protocol Tokenable {
    /// The a token from it's name, returns nil if not found
    func getToken(_ tokenName: String) -> Token?
}

// MARK: - Color Protocols

public protocol SystemColor: Token {
    /// The color it self
    var color: UIColor { get }

    /// The on color name
    var onColorTokenName: String { get }

    /// The color that shoud be using in content inside of the `color`
    var onColor: UIColor { get }
}

public protocol ColorPallete {
    func allColors() -> [SystemColor]
}

// MARK: - Image Protocols

public protocol SystemImage: Token {
    /// The image it self
    var image: UIImage { get }
}

public protocol ImageGroup {
    func allImages() -> [SystemImage]
}

// MARK: - Typography Protocols

public protocol SystemTypography: Token {
    /// The font it self
    var fontName: String { get }
    var font: UIFont { get }
    var size: CGFloat { get }
    var weight: UIFont.Weight { get }
    var lineHeight: CGFloat { get }
    var letterSpacing: CGFloat { get }
}

public protocol TypographyGroup {
    func allTypographys() -> [SystemTypography]
}

public protocol SystemFont: TypographyGroup {}

public protocol SystemFontGroup {
    func allFont() -> [SystemFont]
}

// MARK: - Shadows Protocols

public protocol SystemShadow: Token {
    var color: UIColor { get }
    var opacity: Float { get }
    var offset: CGSize { get }
    var radius: CGFloat { get }
}

public protocol ShadowGroup {
    func allShadows() -> [SystemShadow]
}

public enum SystemShadowSize {
    case small
    case medium
    case large
}

// MARK: - Spacing Protocols

public protocol SystemSpacing: Token {
    var value: CGFloat { get }
}

public protocol SpacingGroup {
    func allSpacings() -> [SystemSpacing]
}

// MARK: - Dividers Protocols

public protocol SystemDivider: Token {
    var color: UIColor { get }
    var lineHeight: CGFloat { get }
    var horizontalSpacing: CGFloat { get }
    var verticalSpacing: CGFloat { get }
}

// MARK: - Alert Protocols

public protocol SystemAlert: Token {
    var titleColor: UIColor { get }
    var descriptionColor: UIColor { get }
    var titleTypography: SystemTypography { get }
    var descriptionTypography: SystemTypography { get }
    var buttonColor: UIColor { get }
}

// MARK: - TextField Protocols

public protocol SystemTextField: Token {
    var labelTypography: SystemTypography { get }
    var placeholderTypography: SystemTypography { get }
    var textTypography: SystemTypography { get }
    var descriptionTypography: SystemTypography { get }
    var placeholderColor: SystemColor { get }
    var textColor: SystemColor { get }
    var disabledTextColor: SystemColor { get }

    var defaultColor: SystemColor { get }
    var activeColor: SystemColor { get }
    var filledColor: SystemColor { get }
    var successColor: SystemColor { get }
    var warningColor: SystemColor { get }
    var errorColor: SystemColor { get }
    var disabledColor: SystemColor { get }
    var disabledBackgroundColor: SystemColor { get }
}

public protocol SystemBoxTextField: Token {
    var labelTypography: SystemTypography { get }
    var placeholderTypography: SystemTypography { get }
    var textTypography: SystemTypography { get }
    var descriptionTypography: SystemTypography { get }
    var placeholderColor: SystemColor { get }
    var textColor: SystemColor { get }
    var disabledTextColor: SystemColor { get }
    var defaultTextColor: SystemColor { get }

    var defaultColor: SystemColor { get }
    var activeColor: SystemColor { get }
    var filledColor: SystemColor { get }
    var successColor: SystemColor { get }
    var warningColor: SystemColor { get }
    var errorColor: SystemColor { get }
    var disabledColor: SystemColor { get }
    var defaultBackgroundColor: SystemColor { get }
    var activeBackgroundColor: SystemColor { get }
    var disabledBackgroundColor: SystemColor { get }
}

// MARK: - Brand Library

public protocol BrandLibrary: Token {
    var typography: FontFamily { get }
    var logo: LogoPrimary { get }
    var logoSymbolsSecondary: LogoSymbols { get }
    var logoSymbols: LogoSymbols { get }
    var colors: BrandLibraryColors { get }
    var systemTheme: SystemTheme { get }
}

public enum SystemTheme {
    case light
    case dark
}

public protocol CosmosAction {}

public protocol Bindable {
    func bindViewModel(_ viewModel: CosmosModel)
    func bindAction(_ action: ((CosmosAction) -> Void)?)
    func bindAction(_ action: (() -> Void)?)
}

public extension Bindable {
    func bindAction(_ action: ((CosmosAction) -> Void)?) {}
    func bindAction(_ action: (() -> Void)?) {}
}

public protocol CosmosModel {}

// MARK: - Accessibility

public struct SystemAccessibility {
    var isAccessibilityElement: Bool?
    var accessibilityLabel: String?
    var accessibilityTraits: UIAccessibilityTraits?
    var accessibilityHint: String?
    var accessibilityValue: String?
    var componentIdentifier: String?

    public init(
        isAccessibilityElement: Bool? = nil,
        accessibilityLabel: String? = nil,
        accessibilityTraits: UIAccessibilityTraits? = nil,
        accessibilityHint: String? = nil,
        accessibilityValue: String? = nil,
        componentIdentifier: String? = nil
    ) {
        self.isAccessibilityElement = isAccessibilityElement
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityTraits = accessibilityTraits
        self.accessibilityHint = accessibilityHint
        self.accessibilityValue = accessibilityValue
        self.componentIdentifier = componentIdentifier
    }
}
