//
//  LogoPrimary.swift
//  Cosmos-Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

public protocol LogoPrimary: ImageGroup {
    var primary: SystemImage { get }
    var primaryVariant: SystemImage { get }
    var primaryBlack: SystemImage { get }
    var primaryWhite: SystemImage { get }
}

public extension LogoPrimary {
    func allImages() -> [SystemImage] {
        [
            primary,
            primaryVariant,
            primaryBlack,
            primaryWhite,
        ]
    }
}
