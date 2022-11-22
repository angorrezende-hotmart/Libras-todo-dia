//
//  Body.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public protocol BodyFont: SystemFont {
    var text0: SystemTypography { get }
    var text1: SystemTypography { get }
    var text2: SystemTypography { get }
    var text3: SystemTypography { get }
    var text4: SystemTypography { get }
}

public extension BodyFont {
    func allTypographys() -> [SystemTypography] {
        [
            text0,
            text1,
            text2,
            text3,
            text4,
        ]
    }
}
