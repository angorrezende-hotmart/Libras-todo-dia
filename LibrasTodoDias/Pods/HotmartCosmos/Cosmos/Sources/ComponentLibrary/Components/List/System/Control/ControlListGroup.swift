//
//  ControlList.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct ControlListGroup: SystemControlList {
    /// Token: "list_control_action_l"
    public let controlActionLeft: SystemList = ControlActionLeftList()
    /// Token: "list_control_switch"
    public let controlSwitch: SystemList = ControlSwitchList()
    /// Token: "list_control_action_lr"
    public let controlActionLeftRight: SystemList = ControlActionLeftRightList()
    /// Token: "list_control_accordion"
    public let controlAccordion: SystemList = ControlAccordionList()
    /// Token: "list_control_button"
    public let controlButton: SystemList = ControlButtonList()
}
