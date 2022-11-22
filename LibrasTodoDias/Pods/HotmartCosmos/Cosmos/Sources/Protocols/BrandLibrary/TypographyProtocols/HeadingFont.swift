//
//  Heading.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 12/04/21.
//

import Foundation

public protocol HeadingFont: SystemFont {
    var text5: SystemTypography { get }
    var text6: SystemTypography { get }
    var text7: SystemTypography { get }
    var text8: SystemTypography { get }
    var text9: SystemTypography { get }
    var text10: SystemTypography { get }
}

public extension HeadingFont {
    func allTypographys() -> [SystemTypography] {
        [
            text5,
            text6,
            text7,
            text8,
            text9,
            text10,
        ]
    }
}
