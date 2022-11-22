//
//  SparkleColors.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 26/08/21.
//

import Foundation

protocol SparkleColors {}

extension SparkleColors where Self: ColorPallete {
    @nonobjc static var primaryDarker: UIColor {
        .init(red: 0.771, green: 0.281, blue: 0.013, alpha: 1)
    }

    @nonobjc static var primaryDark: UIColor {
        .init(red: 0.953, green: 0.357, blue: 0.055, alpha: 1)
    }

    @nonobjc static var primary: UIColor {
        .init(red: 1, green: 0.502, blue: 0.251, alpha: 1)
    }

    @nonobjc static var primaryLight: UIColor {
        .init(red: 1, green: 0.596, blue: 0.388, alpha: 1)
    }

    @nonobjc static var primaryLighter: UIColor {
        .init(red: 1, green: 0.706, blue: 0.557, alpha: 1)
    }

    @nonobjc static var primaryLightest: UIColor {
        .init(red: 1, green: 0.97, blue: 0.954, alpha: 1)
    }

    // MARK: - Secondary colors

    @nonobjc static var secondaryDarker: UIColor {
        .init(red: 0, green: 0.094, blue: 0.118, alpha: 1)
    }

    @nonobjc static var secondaryDark: UIColor {
        .init(red: 0.004, green: 0.165, blue: 0.212, alpha: 1)
    }

    @nonobjc static var secondary: UIColor {
        .init(red: 0.02, green: 0.239, blue: 0.306, alpha: 1)
    }

    @nonobjc static var secondaryLight: UIColor {
        .init(red: 0.082, green: 0.325, blue: 0.392, alpha: 1)
    }

    @nonobjc static var secondaryLighter: UIColor {
        .init(red: 0.376, green: 0.694, blue: 0.773, alpha: 1)
    }

    @nonobjc static var secondaryLightest: UIColor {
        .init(red: 0.906, green: 0.973, blue: 0.992, alpha: 1)
    }

    // MARK: - Neutral

    @nonobjc static var black: UIColor {
        .init(red: 0, green: 0, blue: 0.12, alpha: 1)
    }

    @nonobjc static var neutral900: UIColor {
        .init(red: 0.098, green: 0.108, blue: 0.12, alpha: 1)
    }

    @nonobjc static var neutral800: UIColor {
        .init(red: 0.159, green: 0.171, blue: 0.184, alpha: 1)
    }

    @nonobjc static var neutral700: UIColor {
        .init(red: 0.196, green: 0.212, blue: 0.231, alpha: 1)
    }

    @nonobjc static var neutral600: UIColor {
        .init(red: 0.275, green: 0.295, blue: 0.32, alpha: 1)
    }

    @nonobjc static var neutral500: UIColor {
        .init(red: 0.44, green: 0.466, blue: 0.5, alpha: 1)
    }

    @nonobjc static var neutral400: UIColor {
        .init(red: 0.621, green: 0.644, blue: 0.675, alpha: 1)
    }

    @nonobjc static var neutral300: UIColor {
        .init(red: 0.789, green: 0.806, blue: 0.83, alpha: 1)
    }

    @nonobjc static var neutral200: UIColor {
        .init(red: 0.902, green: 0.914, blue: 0.93, alpha: 1)
    }

    @nonobjc static var neutral100: UIColor {
        .init(red: 0.957, green: 0.969, blue: 0.972, alpha: 1)
    }

    @nonobjc static var white: UIColor {
        .init(red: 1, green: 1, blue: 1, alpha: 1)
    }

    // MARK: - Green

    @nonobjc static var greenDarker: UIColor {
        .init(red: 0, green: 0.318, blue: 0.133, alpha: 1)
    }

    @nonobjc static var greenDark: UIColor {
        .init(red: 0, green: 0.431, blue: 0.186, alpha: 1)
    }

    @nonobjc static var green: UIColor {
        .init(red: 0, green: 0.616, blue: 0.263, alpha: 1)
    }

    @nonobjc static var greenLight: UIColor {
        .init(red: 0.29, green: 0.8, blue: 0.509, alpha: 1)
    }

    @nonobjc static var greenLighter: UIColor {
        .init(red: 0.639, green: 0.953, blue: 0.773, alpha: 1)
    }

    @nonobjc static var greenLightest: UIColor {
        .init(red: 0.922, green: 0.992, blue: 0.953, alpha: 1)
    }

    // MARK: - Red

    @nonobjc static var redDarker: UIColor {
        .init(red: 0.512, green: 0.05, blue: 0, alpha: 1)
    }

    @nonobjc static var redDark: UIColor {
        .init(red: 0.658, green: 0.102, blue: 0.041, alpha: 1)
    }

    @nonobjc static var red: UIColor {
        .init(red: 0.839, green: 0.204, blue: 0.173, alpha: 1)
    }

    @nonobjc static var redLight: UIColor {
        .init(red: 0.892, green: 0.458, blue: 0.438, alpha: 1)
    }

    @nonobjc static var redLighter: UIColor {
        .init(red: 0.975, green: 0.793, blue: 0.784, alpha: 1)
    }

    @nonobjc static var redLightest: UIColor {
        .init(red: 1, green: 0.942, blue: 0.94, alpha: 1)
    }

    // MARK: - Blue

    @nonobjc static var blueDarker: UIColor {
        .init(red: 0.144, green: 0.247, blue: 0.508, alpha: 1)
    }

    @nonobjc static var blueDark: UIColor {
        .init(red: 0.208, green: 0.361, blue: 0.753, alpha: 1)
    }

    @nonobjc static var blue: UIColor {
        .init(red: 0.349, green: 0.505, blue: 0.892, alpha: 1)
    }

    @nonobjc static var blueLight: UIColor {
        .init(red: 0.537, green: 0.659, blue: 0.973, alpha: 1)
    }

    @nonobjc static var blueLighter: UIColor {
        .init(red: 0.745, green: 0.82, blue: 1, alpha: 1)
    }

    @nonobjc static var blueLightest: UIColor {
        .init(red: 0.941, green: 0.957, blue: 1, alpha: 1)
    }

    // MARK: - Yellow

    @nonobjc static var yellowDarker: UIColor {
        .init(red: 0.425, green: 0.322, blue: 0, alpha: 1)
    }

    @nonobjc static var yellowDark: UIColor {
        .init(red: 0.642, green: 0.487, blue: 0, alpha: 1)
    }

    @nonobjc static var yellow: UIColor {
        .init(red: 0.937, green: 0.729, blue: 0.059, alpha: 1)
    }

    @nonobjc static var yellowLight: UIColor {
        .init(red: 0.983, green: 0.831, blue: 0.344, alpha: 1)
    }

    @nonobjc static var yellowLighter: UIColor {
        .init(red: 0.975, green: 0.885, blue: 0.597, alpha: 1)
    }

    @nonobjc static var yellowLightest: UIColor {
        .init(red: 1, green: 0.98, blue: 0.92, alpha: 1)
    }

    // MARK: - Purple

    @nonobjc static var purpleDarker: UIColor {
        .init(red: 0.28, green: 0.153, blue: 0.692, alpha: 1)
    }

    @nonobjc static var purpleDark: UIColor {
        .init(red: 0.353, green: 0.22, blue: 0.775, alpha: 1)
    }

    @nonobjc static var purple: UIColor {
        .init(red: 0.486, green: 0.369, blue: 0.886, alpha: 1)
    }

    @nonobjc static var purpleLight: UIColor {
        .init(red: 0.675, green: 0.576, blue: 0.988, alpha: 1)
    }

    @nonobjc static var purpleLighter: UIColor {
        .init(red: 0.829, green: 0.777, blue: 0.992, alpha: 1)
    }

    @nonobjc static var purpleLightest: UIColor {
        .init(red: 0.964, green: 0.95, blue: 1, alpha: 1)
    }

    // MARK: - Cian

    @nonobjc static var cianDarker: UIColor {
        .init(red: 0.022, green: 0.383, blue: 0.383, alpha: 1)
    }

    @nonobjc static var cianDark: UIColor {
        .init(red: 0.04, green: 0.567, blue: 0.567, alpha: 1)
    }

    @nonobjc static var cian: UIColor {
        .init(red: 0.318, green: 0.757, blue: 0.765, alpha: 1)
    }

    @nonobjc static var cianLight: UIColor {
        .init(red: 0.486, green: 0.859, blue: 0.859, alpha: 1)
    }

    @nonobjc static var cianLighter: UIColor {
        .init(red: 0.634, green: 0.917, blue: 0.917, alpha: 1)
    }

    @nonobjc static var cianLightest: UIColor {
        .init(red: 0.93, green: 1, blue: 1, alpha: 1)
    }
}
