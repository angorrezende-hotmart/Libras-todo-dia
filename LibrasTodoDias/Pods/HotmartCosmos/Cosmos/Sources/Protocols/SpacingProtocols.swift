//
//  SpacingProtocols.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 06/05/21.
//

import Foundation

public protocol SpacingProtocols: SpacingGroup {
    var spacing9: SystemSpacing { get }
    var spacing8: SystemSpacing { get }
    var spacing7: SystemSpacing { get }
    var spacing6: SystemSpacing { get }
    var spacing5: SystemSpacing { get }
    var spacing4: SystemSpacing { get }
    var spacing3: SystemSpacing { get }
    var spacing2: SystemSpacing { get }
    var spacing1: SystemSpacing { get }
}

public extension SpacingProtocols {
    func allSpacings() -> [SystemSpacing] {
        [
            spacing9,
            spacing8,
            spacing7,
            spacing6,
            spacing5,
            spacing4,
            spacing3,
            spacing2,
            spacing1,
        ]
    }
}
