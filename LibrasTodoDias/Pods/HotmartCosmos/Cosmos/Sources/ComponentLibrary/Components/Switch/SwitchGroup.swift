//
//  SwitchGroup.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

struct SwitchGroup: SystemSwitchGroup {
    /// Token: `switch_default`
    var `default`: SystemSwitch = DefaultSwitch()

    private struct DefaultSwitch: SystemSwitch {
        let tokenName: String = "switch_default"

        var activeColor: SystemColor {
            Cosmos.colors.productColors.blueProductColor.color
        }
    }
}
