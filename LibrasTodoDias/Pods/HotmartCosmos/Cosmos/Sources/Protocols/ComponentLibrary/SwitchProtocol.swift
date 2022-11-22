//
//  SwitchProtocol.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public protocol SystemSwitchGroup {
    var `default`: SystemSwitch { get }
}

public protocol SystemSwitch: Token {
    var activeColor: SystemColor { get }
}
