//
//  TextFieldModel.swift
//  HotmartCosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 02/07/21.
//

import Foundation

public struct TextFieldModel: CosmosModel {
    public var label: String
    public var description: String?
    public var value: String?
    public var style: Style
    public var state: State
    public var rightIcon: IconSet?
    public var characterLimit: Int?
    public var keyboardType: UIKeyboardType?
    public var autocapitalizationType: UITextAutocapitalizationType?
    public var textMask: Mask?
    public var characterSet: CharacterSet?

    public init(
        label: String,
        description: String?,
        value: String? = nil,
        style: Style,
        state: State = .default,
        rightIcon: IconSet? = nil,
        characterLimit: Int? = nil,
        keyboardType: UIKeyboardType? = nil,
        autocapitalizationType: UITextAutocapitalizationType? = nil,
        textMask: Mask? = nil,
        characterSet: CharacterSet? = nil
    ) {
        self.label = label
        self.description = description
        self.value = value
        self.style = style
        self.state = state
        self.rightIcon = rightIcon
        self.characterLimit = characterLimit
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.textMask = textMask
        self.characterSet = characterSet
    }

    // MARK: - Enums

    public enum State: Equatable {
        case `default`
        case active
        case filled
        case sucess
        case warning
        case error
        case disabledEmpty
        case disabledFilled

        func getColor() -> UIColor {
            let system = TextField(state: self)
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
            case .disabledEmpty, .disabledFilled:
                return system.disabledColor.color
            }
        }

        func getBackgroundColor() -> UIColor {
            let system = TextField(state: self)
            switch self {
            case .disabledFilled, .disabledEmpty:
                return system.disabledBackgroundColor.color
            default:
                return .clear
            }
        }
    }

    public enum Style: Equatable {
        case base
        case custom(_ keyboardType: UIKeyboardType = .default)
        case currency(prefix: String, locale: Locale)
        case expansible
        case dropdown(options: [String] = [], model: BottomSheetModel? = nil)
        case secure(isSecure: Bool, isIconHidden: Bool = false)
        case loading(isLoading: Bool)
        case datePicker(cancelLabel: String, readyLabel: String)

        public static func == (lhs: TextFieldModel.Style, rhs: TextFieldModel.Style) -> Bool {
            switch (lhs, rhs) {
            case (.base, .base),
                 (.expansible, .expansible),
                 (.dropdown, .dropdown),
                 (.secure, .secure):
                return true
            default:
                return false
            }
        }
    }

    public func getSystem() -> SystemTextField {
        TextField(state: state)
    }
}

public enum TextFieldAction: CosmosAction {
    case textFieldShouldUpdateHeight
    case didTapDropdownButton(_ viewController: UIViewController)
    case dropdownDidSelectAt(_ index: Int)
    case textDidChange(_ text: String)
    case textFieldReturnPressed(_ textField: UITextField)
    case didToggleSecure(_ secure: Bool)
    case didTapRightIcon
}

public struct BrazilianPhoneMask: Mask {
    public var maskFormat: String = "+## (##) #####-####"

    public init() {}

    public func formateValue(_ value: String) -> String {
        let cleanValue = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = maskFormat
        var result = ""
        var index = cleanValue.startIndex
        for ch in mask where index < cleanValue.endIndex {
            if ch == "#" {
                result.append(cleanValue[index])
                index = cleanValue.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

public protocol Mask {
    var maskFormat: String { get set }

    func formateValue(_ value: String) -> String
}
