//
//  AttentionBoxProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 14/07/21.
//

import Foundation

public protocol SystemAttentionBoxGroup {
    var yellow: SystemAttentionBox { get }
    var red: SystemAttentionBox { get }
    var green: SystemAttentionBox { get }
    var gray: SystemAttentionBox { get }
    var blue: SystemAttentionBox { get }
}

public protocol SystemAttentionBox {
    var backgroundColor: SystemColor { get }
    var typography: SystemAttentionBoxTypography { get }
    var color: SystemAttentionBoxColor { get }
    var buttonModel: ButtonModel { get set }
}

public protocol SystemAttentionBoxColor {
    var title: SystemColor { get }
    var description: SystemColor { get }
    var icon: SystemColor { get }
}

public protocol SystemAttentionBoxTypography {
    var title: SystemTypography { get }
    var description: SystemTypography { get }
}
