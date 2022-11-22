//
//  ButtonProtocols.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 06/05/21.
//

import UIKit

public protocol SystemButtonGroup {
    var primary: SystemButton { get }
    var secondary: SystemButton { get }
    var tertiary: SystemButton { get }
    var `default`: SystemButton { get }
    var cta: SystemButton { get }
    var danger: SystemButton { get }
    var custom: SystemButton { get }

    func allButtons() -> [SystemButton]
}

public protocol SystemButton {
    var color: SystemButtonColor { get }
    var disabledColor: SystemButtonColor { get }
    var typography: SystemButtonTypography { get }
}

public protocol SystemButtonColor {
    var text: SystemColor { get }
    var background: SystemColor { get }
    var border: SystemColor? { get }
}

public protocol SystemButtonTypography {
    var small: SystemTypography { get }
    var medium: SystemTypography { get }
}

public protocol SystemBorderRadiusGroup {
    var small: SystemBorderRadius { get }
    var medium: SystemBorderRadius { get }
}
