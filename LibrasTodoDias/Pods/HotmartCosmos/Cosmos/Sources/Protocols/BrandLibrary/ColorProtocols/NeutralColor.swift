//
//  NeutralColor.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public protocol NeutralColor: ColorPallete {
    var black: SystemColor { get }
    var neutral900: SystemColor { get }
    var neutral800: SystemColor { get }
    var neutral700: SystemColor { get }
    var neutral600: SystemColor { get }
    var neutral500: SystemColor { get }
    var neutral400: SystemColor { get }
    var neutral300: SystemColor { get }
    var neutral200: SystemColor { get }
    var neutral100: SystemColor { get }
    var white: SystemColor { get }
    var backgroundPrimary: SystemColor { get }
    var backgroundSecondary: SystemColor { get }
    var backgroundBlur: SystemColor { get }
    var overlay: SystemColor { get }
    var clear: SystemColor { get }
}

public extension NeutralColor {
    func allColors() -> [SystemColor] {
        [
            black,
            neutral900,
            neutral800,
            neutral700,
            neutral600,
            neutral500,
            neutral400,
            neutral300,
            neutral200,
            neutral100,
            white,
            backgroundPrimary,
            backgroundSecondary,
            backgroundBlur,
            overlay,
        ]
    }
}
