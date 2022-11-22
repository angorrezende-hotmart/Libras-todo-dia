//
//  ExpandableLabelModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import Foundation

public struct TruncatedLabelModel: CosmosModel {
    public var text: String
    public var expandLabelText: String
    public var numberOfLinesWhenCollapsed: Int
    public var style: Style
    internal var isCollapsed: Bool

    public var expandLabelTypography: SystemTypography?
    public var textColor: (() -> SystemColor)?
    public var textTypography: SystemTypography?
    public var textAligment: NSTextAlignment

    public init(
        text: String,
        expandLabelText: String,
        numberOfLinesWhenCollapsed: Int,
        style: Style,
        textAligment: NSTextAlignment = .left,
        isCollapsed: Bool = true
    ) {
        self.text = text
        self.expandLabelText = expandLabelText
        self.numberOfLinesWhenCollapsed = numberOfLinesWhenCollapsed
        self.style = style
        self.textAligment = textAligment
        self.isCollapsed = isCollapsed
    }

    public init(
        text: String,
        textTypography: SystemTypography,
        textColor: @escaping () -> SystemColor,
        expandLabelText: String,
        expandLabelTypography: SystemTypography,
        numberOfLinesWhenCollapsed: Int,
        style: Style,
        textAligment: NSTextAlignment = .left,
        isCollapsed: Bool = true
    ) {
        self.text = text
        self.textTypography = textTypography
        self.textColor = textColor
        self.expandLabelText = expandLabelText
        self.expandLabelTypography = expandLabelTypography
        self.numberOfLinesWhenCollapsed = numberOfLinesWhenCollapsed
        self.textAligment = textAligment
        self.style = style
        self.isCollapsed = isCollapsed
    }

    public enum Style {
        case expandable
        case actionOnly
    }
}

public enum TruncatedLabelAction: CosmosAction {
    case expand
    case collapse
    case onTapAction
}
