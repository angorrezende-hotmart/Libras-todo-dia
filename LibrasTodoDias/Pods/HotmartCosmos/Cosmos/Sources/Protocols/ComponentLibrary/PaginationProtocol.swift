//
//  PaginationProtocol.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 27/01/22.
//

import Foundation

public protocol SystemPaginationGroup {
    var `default`: SystemPagination { get }
    var white: SystemPagination { get }
    var black: SystemPagination { get }
}

public protocol SystemPagination: Token {
    var defaultColor: SystemColor { get }
    var activeColor: SystemColor { get }
}
