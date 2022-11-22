//
//  BoxTextFieldModel.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 10/12/21.
//

import Foundation

public struct BoxTextFieldModel: CosmosModel {
    public var description: String?
    public var value: String?
    public var state: State
    public var numberOfItems: Int
    public var keyboardType: UIKeyboardType
    public var isSecureTextEntry: Bool

    public init(
        description: String?,
        value: String? = nil,
        numberOfItems: Int,
        state: State = .default,
        keyboardType: UIKeyboardType = .numberPad,
        isSecureTextEntry: Bool = false
    ) {
        self.description = description
        self.value = value
        self.state = state
        self.numberOfItems = numberOfItems
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
    }

    // MARK: - Enums

    public enum State: String {
        case `default`
        case active
        case filled
        case sucess
        case warning
        case error
        case disabled

        func getTextColor() -> UIColor {
            let system = BoxTextField()
            switch self {
            case .default:
                return system.defaultTextColor.color
            case .disabled:
                return system.disabledTextColor.color
            default:
                return system.textColor.color
            }
        }

        func getBorderColor() -> UIColor {
            let system = BoxTextField()
            switch self {
            case .default:
                return system.defaultColor.color
            case .active:
                return system.activeColor.color
            case .filled:
                return system.filledColor.color
            case .sucess:
                return system.successColor.color
            case .warning:
                return system.warningColor.color
            case .error:
                return system.errorColor.color
            case .disabled:
                return system.disabledColor.color
            }
        }

        func getBackgroundColor() -> UIColor {
            let system = BoxTextField()
            switch self {
            case .active:
                return system.activeBackgroundColor.color
            case .disabled:
                return system.disabledBackgroundColor.color
            default:
                return system.defaultBackgroundColor.color
            }
        }
    }

    public func getSystem() -> SystemBoxTextField {
        BoxTextField()
    }
}

public enum BoxTextFieldAction: CosmosAction {
    case textDidChange(_ text: String)
    case textFinishEdit(_ text: String)
    case textFieldReturnPressed(_ textField: UITextField)
    case textFieldDidBeginEditing
}
