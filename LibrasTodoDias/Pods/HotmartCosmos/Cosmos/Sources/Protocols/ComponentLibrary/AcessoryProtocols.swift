//
//  AcessoryProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

protocol SystemAcessoryMidia: Token {
    var typography: SystemTypography? { get }
    var color: SystemColor { get }
    var backgroundColor: SystemColor { get }
}

protocol SystemAcessoryMidiaGroup {
    var live: SystemAcessoryMidia { get }
    var audio: SystemAcessoryMidia { get }
    var video: SystemAcessoryMidia { get }
}
