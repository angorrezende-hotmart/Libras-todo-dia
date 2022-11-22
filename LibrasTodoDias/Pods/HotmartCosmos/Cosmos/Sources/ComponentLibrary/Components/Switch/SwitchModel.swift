//
//  SwitchModel.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 22/06/21.
//

public struct SwitchModel: CosmosModel {
    public var isOn: Bool
    public var style: Style

    public init(
        isOn: Bool,
        style: Style
    ) {
        self.isOn = isOn
        self.style = style
    }

    // MARK: - Enums

    public enum Style: String {
        case `default`
    }

    public func getSystemSwitch() -> SystemSwitch {
        let switchGroup = SwitchGroup()
        switch style {
        case .default:
            return switchGroup.default
        }
    }

    public func getTokenName() -> String {
        style.rawValue + "_" + (isOn ? "_isOn" : "_isOff")
    }
}

public enum SwitchAction: CosmosAction {
    case toggle(isOn: Bool)
}
