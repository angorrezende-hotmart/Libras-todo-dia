//
//  BodyStrong.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public protocol BodyStrongFont: SystemFont {
    var text0Strong: SystemTypography { get }
    var text1Strong: SystemTypography { get }
    var text2Strong: SystemTypography { get }
    var text3Strong: SystemTypography { get }
    var text4Strong: SystemTypography { get }
}

public extension BodyStrongFont {
    func allTypographys() -> [SystemTypography] {
        [
            text0Strong,
            text1Strong,
            text2Strong,
            text3Strong,
            text4Strong,
        ]
    }
}
