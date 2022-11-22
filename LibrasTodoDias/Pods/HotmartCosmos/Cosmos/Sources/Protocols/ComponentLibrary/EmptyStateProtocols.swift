//
//  EmptyStateProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 04/11/21.
//

import Foundation

public protocol SystemEmptyStateGroup {
    var basic: SystemEmptyState { get }
    var actions: SystemEmptyState { get }
}

public protocol SystemEmptyState: Token {
    var color: SystemEmptyStateColor { get }
    var typography: SystemEmptyStateTypography { get }
}

public protocol SystemEmptyStateColor {
    var title: SystemColor { get }
    var description: SystemColor { get }
    var roundedView: SystemColor { get }
    var image: SystemColor { get }
}

public protocol SystemEmptyStateTypography {
    var title: SystemTypography { get }
    var description: SystemTypography { get }
}
