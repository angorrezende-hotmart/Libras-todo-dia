//
//  SystemShadows.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 03/05/21.
//

import Foundation

public protocol SystemShadows: ShadowGroup {
    var small: SystemShadow { get }
    var medium: SystemShadow { get }
    var large: SystemShadow { get }
}

public extension SystemShadows {
    func allShadows() -> [SystemShadow] {
        [
            small,
            medium,
            large,
        ]
    }
}
