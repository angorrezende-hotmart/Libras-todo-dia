//
//  SparkleDarkColors.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 26/08/21.
//

protocol SparkleDarkColors {}

extension SparkleDarkColors where Self: ColorPallete {
    // MARK: - Primary colors

    @nonobjc static var primaryDarker: UIColor {
        .init(red: 1, green: 0.94, blue: 0.91, alpha: 1)
    }

    @nonobjc static var primaryDark: UIColor {
        .init(red: 1, green: 0.64, blue: 0.43, alpha: 1)
    }

    @nonobjc static var primary: UIColor {
        .init(red: 1, green: 0.5, blue: 0.25, alpha: 1)
    }

    @nonobjc static var primaryLight: UIColor {
        .init(red: 0.98, green: 0.38, blue: 0.08, alpha: 1)
    }

    @nonobjc static var primaryLighter: UIColor {
        .init(red: 0.72, green: 0.23, blue: 0.0, alpha: 1)
    }

    @nonobjc static var primaryLightest: UIColor {
        .init(red: 0.42, green: 0.15, blue: 0.0, alpha: 1)
    }

    // MARK: - Secondary colors

    @nonobjc static var secondaryDarker: UIColor {
        .init(red: 0.91, green: 0.97, blue: 0.99, alpha: 1)
    }

    @nonobjc static var secondaryDark: UIColor {
        .init(red: 0.38, green: 0.69, blue: 0.77, alpha: 1)
    }

    @nonobjc static var secondary: UIColor {
        .init(red: 0.11, green: 0.47, blue: 0.56, alpha: 1)
    }

    @nonobjc static var secondaryLight: UIColor {
        .init(red: 0.06, green: 0.33, blue: 0.42, alpha: 1)
    }

    @nonobjc static var secondaryLighter: UIColor {
        .init(red: 0.01, green: 0.23, blue: 0.29, alpha: 1)
    }

    @nonobjc static var secondaryLightest: UIColor {
        .init(red: 0.0, green: 0.09, blue: 0.12, alpha: 1)
    }

    // MARK: - Neutral

    @nonobjc static var black: UIColor {
        .init(red: 0, green: 0, blue: 0.12, alpha: 1)
    }

    @nonobjc static var neutral900: UIColor {
        .init(red: 0.98, green: 0.98, blue: 0.99, alpha: 1)
    }

    @nonobjc static var neutral800: UIColor {
        .init(red: 0.9, green: 0.91, blue: 0.93, alpha: 1)
    }

    @nonobjc static var neutral700: UIColor {
        .init(red: 0.79, green: 0.81, blue: 0.83, alpha: 1)
    }

    @nonobjc static var neutral600: UIColor {
        .init(red: 0.62, green: 0.64, blue: 0.67, alpha: 1)
    }

    @nonobjc static var neutral500: UIColor {
        .init(red: 0.44, green: 0.47, blue: 0.5, alpha: 1)
    }

    @nonobjc static var neutral400: UIColor {
        .init(red: 0.27, green: 0.29, blue: 0.32, alpha: 1)
    }

    @nonobjc static var neutral300: UIColor {
        .init(red: 0.2, green: 0.21, blue: 0.23, alpha: 1)
    }

    @nonobjc static var neutral200: UIColor {
        .init(red: 0.16, green: 0.17, blue: 0.18, alpha: 1)
    }

    @nonobjc static var neutral100: UIColor {
        .init(red: 0.13, green: 0.15, blue: 0.16, alpha: 1)
    }

    @nonobjc static var bacgkroundPrimary: UIColor {
        .init(red: 0.08, green: 0.09, blue: 0.1, alpha: 1)
    }

    @nonobjc static var bacgkroundSecondary: UIColor {
        .init(red: 0.16, green: 0.17, blue: 0.18, alpha: 1)
    }

    @nonobjc static var bacgkroundBlur: UIColor {
        .init(red: 0.1, green: 0.11, blue: 0.12, alpha: 0.9)
    }

    @nonobjc static var white: UIColor {
        .init(red: 1, green: 1, blue: 1, alpha: 1)
    }

    // MARK: - Green

    @nonobjc static var greenDarker: UIColor {
        .init(red: 0.8, green: 1.0, blue: 0.89, alpha: 1)
    }

    @nonobjc static var greenDark: UIColor {
        .init(red: 0.3, green: 0.84, blue: 0.53, alpha: 1)
    }

    @nonobjc static var green: UIColor {
        .init(red: 0.0, green: 0.62, blue: 0.26, alpha: 1)
    }

    @nonobjc static var greenLight: UIColor {
        .init(red: 0.0, green: 0.43, blue: 0.19, alpha: 1)
    }

    @nonobjc static var greenLighter: UIColor {
        .init(red: 0.0, green: 0.35, blue: 0.15, alpha: 1)
    }

    @nonobjc static var greenLightest: UIColor {
        .init(red: 0.04, green: 0.27, blue: 0.14, alpha: 1)
    }

    // MARK: - Blue

    @nonobjc static var blueDarker: UIColor {
        .init(red: 0.91, green: 0.94, blue: 1, alpha: 1)
    }

    @nonobjc static var blueDark: UIColor {
        .init(red: 0.54, green: 0.66, blue: 0.97, alpha: 1)
    }

    @nonobjc static var blue: UIColor {
        .init(red: 0.35, green: 0.5, blue: 0.89, alpha: 1)
    }

    @nonobjc static var blueLight: UIColor {
        .init(red: 0.21, green: 0.36, blue: 0.75, alpha: 1)
    }

    @nonobjc static var blueLighter: UIColor {
        .init(red: 0.1, green: 0.24, blue: 0.58, alpha: 1)
    }

    @nonobjc static var blueLightest: UIColor {
        .init(red: 0.05, green: 0.14, blue: 0.35, alpha: 1)
    }

    // MARK: - Yellow

    @nonobjc static var yellowDarker: UIColor {
        .init(red: 1.0, green: 0.96, blue: 0.83, alpha: 1)
    }

    @nonobjc static var yellowDark: UIColor {
        .init(red: 0.98, green: 0.83, blue: 0.34, alpha: 1)
    }

    @nonobjc static var yellow: UIColor {
        .init(red: 0.94, green: 0.73, blue: 0.06, alpha: 1)
    }

    @nonobjc static var yellowLight: UIColor {
        .init(red: 0.73, green: 0.55, blue: 0.0, alpha: 1)
    }

    @nonobjc static var yellowLighter: UIColor {
        .init(red: 0.6, green: 0.46, blue: 0.0, alpha: 1)
    }

    @nonobjc static var yellowLightest: UIColor {
        .init(red: 0.44, green: 0.29, blue: 0.0, alpha: 1)
    }

    // MARK: - Purple

    @nonobjc static var purpleDarker: UIColor {
        .init(red: 0.94, green: 0.91, blue: 1.0, alpha: 1)
    }

    @nonobjc static var purpleDark: UIColor {
        .init(red: 0.67, green: 0.58, blue: 0.99, alpha: 1)
    }

    @nonobjc static var purple: UIColor {
        .init(red: 0.49, green: 0.37, blue: 0.89, alpha: 1)
    }

    @nonobjc static var purpleLight: UIColor {
        .init(red: 0.35, green: 0.22, blue: 0.77, alpha: 1)
    }

    @nonobjc static var purpleLighter: UIColor {
        .init(red: 0.27, green: 0.15, blue: 0.67, alpha: 1)
    }

    @nonobjc static var purpleLightest: UIColor {
        .init(red: 0.18, green: 0.11, blue: 0.38, alpha: 1)
    }

    // MARK: - Red

    @nonobjc static var redDarker: UIColor {
        .init(red: 1.0, green: 0.89, blue: 0.89, alpha: 1)
    }

    @nonobjc static var redDark: UIColor {
        .init(red: 0.89, green: 0.46, blue: 0.44, alpha: 1)
    }

    @nonobjc static var red: UIColor {
        .init(red: 0.84, green: 0.2, blue: 0.17, alpha: 1)
    }

    @nonobjc static var redLight: UIColor {
        .init(red: 0.66, green: 0.1, blue: 0.04, alpha: 1)
    }

    @nonobjc static var redLighter: UIColor {
        .init(red: 0.51, green: 0.05, blue: 0.0, alpha: 1)
    }

    @nonobjc static var redLightest: UIColor {
        .init(red: 0.35, green: 0.07, blue: 0.04, alpha: 1)
    }

    // MARK: - Cian

    @nonobjc static var cianDarker: UIColor {
        .init(red: 0.92, green: 1.0, blue: 1.0, alpha: 1)
    }

    @nonobjc static var cianDark: UIColor {
        .init(red: 0.49, green: 0.86, blue: 0.86, alpha: 1)
    }

    @nonobjc static var cian: UIColor {
        .init(red: 0.32, green: 0.76, blue: 0.76, alpha: 1)
    }

    @nonobjc static var cianLight: UIColor {
        .init(red: 0.04, green: 0.56, blue: 0.56, alpha: 1)
    }

    @nonobjc static var cianLighter: UIColor {
        .init(red: 0.02, green: 0.38, blue: 0.38, alpha: 1)
    }

    @nonobjc static var cianLightest: UIColor {
        .init(red: 0.01, green: 0.28, blue: 0.28, alpha: 1)
    }
}
