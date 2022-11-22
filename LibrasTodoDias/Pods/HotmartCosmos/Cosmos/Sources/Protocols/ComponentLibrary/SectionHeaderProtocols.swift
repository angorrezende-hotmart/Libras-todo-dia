//
//  SectionHeaderProtocols.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

protocol SystemSectionHeaderGroup {
    var secHeader: SystemSectionHeader { get }
    var secHeaderDesc: SystemSectionHeader { get }
    var secHeaderAction: SystemSectionHeader { get }
    var secHeaderActionDesc: SystemSectionHeader { get }
}

protocol SystemSectionHeader: Token {
    var titleTypography: SystemTypography { get }
    var subtitleTypography: SystemTypography? { get }
    var buttonTypography: SystemTypography? { get }

    var titleColor: SystemColor { get }
    var subtitleColor: SystemColor? { get }
    var buttonColor: SystemColor? { get }
    var disabledColor: SystemColor? { get }
}
