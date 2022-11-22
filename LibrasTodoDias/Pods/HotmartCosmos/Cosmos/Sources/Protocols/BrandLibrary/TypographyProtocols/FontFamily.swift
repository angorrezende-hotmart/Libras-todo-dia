//
//  FontFamily.swift
//  CosmosInterface
//
//  Created by Rafael Lage Moreira Barbosa on 22/04/21.
//

import Foundation

public protocol FontFamily: SystemFontGroup {
    var body: BodyFont { get }
    var bodyStrong: BodyStrongFont { get }
    var heading: HeadingFont { get }
}

public extension FontFamily {
    func allFont() -> [SystemFont] {
        [body, bodyStrong, heading]
    }
}
