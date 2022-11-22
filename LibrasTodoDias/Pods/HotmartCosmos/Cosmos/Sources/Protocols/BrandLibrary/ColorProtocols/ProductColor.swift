//
//  ProductColor.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public protocol ProductColor: ColorPallete {
    var darker: SystemColor { get }
    var dark: SystemColor { get }
    var color: SystemColor { get }
    var light: SystemColor { get }
    var lighter: SystemColor { get }
    var lightest: SystemColor { get }
}

public extension ProductColor {
    func allColors() -> [SystemColor] {
        [
            darker,
            dark,
            color,
            light,
            lighter,
            lightest,
        ]
    }
}
