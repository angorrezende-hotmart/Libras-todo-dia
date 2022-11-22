//
//  LocalSearchModel.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 07/01/22.
//

import Foundation

public struct LocalSearchModel: CosmosModel {
    public var placeholder: String
    public var keyboardType: UIKeyboardType?

    public init(
        placeholder: String,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
}

public enum LocalSearchAction: CosmosAction {
    case searchTextDidChange(string: String?)
    case textFieldDidEndEditing(textField: UITextField)
}
