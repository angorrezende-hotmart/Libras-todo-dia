//
//  TagProtocols.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

protocol SystemTagGroup {
    var gray: SystemTag { get }
    var grayIcon: SystemTag { get }

    var green: SystemTag { get }
    var greenIcon: SystemTag { get }

    var yellow: SystemTag { get }
    var yellowIcon: SystemTag { get }

    var red: SystemTag { get }
    var redIcon: SystemTag { get }
}

protocol SystemTag: Token {
    var typography: SystemTypography { get }
    var textColor: SystemColor { get }
    var backgroundColor: SystemColor { get }
}
