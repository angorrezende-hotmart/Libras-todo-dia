//
//  BottomSheetModel.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

public struct BottomSheetModel: CosmosModel {
    public var header: HeaderStyle
    public var footer: FooterStyle
    public var hideIndicator: Bool
    public var keepOpenAfterAction: Bool
    internal var optionsModel: BottomSheetOptionsModel?

    public var style: Style {
        didSet {
            setOptionsModels()
        }
    }

    public init(
        header: HeaderStyle,
        style: Style,
        footer: FooterStyle,
        hideIndicator: Bool = false,
        keepOpenAfterAction: Bool = false
    ) {
        self.header = header
        self.style = style
        self.footer = footer
        self.hideIndicator = hideIndicator
        self.keepOpenAfterAction = keepOpenAfterAction
        setOptionsModels()
    }

    private mutating func setOptionsModels() {
        if case let .list(models) = style {
            optionsModel = models
        }
    }

    public enum Style {
        case `default`
        case list(models: BottomSheetOptionsModel)
        case custom(view: UIView)
    }

    public enum HeaderStyle: Equatable {
        case none
        case withThumb(image: UIImage, title: String? = nil, subtitle: String? = nil, description: String? = nil, titleFont: SystemTypography? = nil)
        case normal(title: String? = nil, subtitle: String? = nil, description: String? = nil, titleFont: SystemTypography? = nil)
        case leftAligned(title: String? = nil, subtitle: String? = nil, description: String? = nil, titleFont: SystemTypography? = nil)

        public static func == (lhs: BottomSheetModel.HeaderStyle, rhs: BottomSheetModel.HeaderStyle) -> Bool {
            switch (lhs, rhs) {
            case (.none, .none),
                 (.withThumb, .withThumb),
                 (.normal, .normal),
                 (.leftAligned, .leftAligned):
                return true
            default:
                return false
            }
        }
    }

    public enum FooterStyle {
        case primaryAndSecondary(primaryText: String, secondaryText: String)
        case primaryAndTerciary(primaryText: String, terciaryText: String)
        case primaryOnly(text: String)
        case secondaryOnly(text: String)
        case terciaryOnly(text: String)
        case custom(firsButtonModel: ButtonModel, secondButtonModel: ButtonModel? = nil, thirdButtonModel: ButtonModel? = nil)
        case none
    }
}

public enum BottomSheetAction: CosmosAction {
    case primaryButtonTap(text: String, index: Int?, indexList: [Int]?, indexPathList: [IndexPath]?)
    case secondaryButtonTap(text: String, index: Int?, indexList: [Int]?, indexPathList: [IndexPath]?)
    case tertiaryButtonTap(text: String, index: Int?, indexList: [Int]?, indexPathList: [IndexPath]?)
    case customButtonTap(buttonModel: ButtonModel, index: Int?, indexList: [Int]?, indexPathList: [IndexPath]?)
    case selected(index: Int?)
    case dismiss
}

public struct BottomSheetOptionsModel: CosmosModel {
    public var sectionTitle: String?
    public var sectionDescription: String?
    public var listModels: [ListModel]
    public var pillsModel: [PillsModel]
    public var cardsDescriptionModel: [CardModel]

    public init(
        sectionTitle: String? = nil,
        sectionDescription: String? = nil,
        listModels: [ListModel]
    ) {
        self.sectionTitle = sectionTitle
        self.sectionDescription = sectionDescription
        self.listModels = listModels
        pillsModel = []
        cardsDescriptionModel = []
    }

    public init(
        sectionTitle: String? = nil,
        sectionDescription: String? = nil,
        pillsModel: [PillsModel]
    ) {
        self.sectionTitle = sectionTitle
        self.sectionDescription = sectionDescription
        self.pillsModel = pillsModel
        listModels = []
        cardsDescriptionModel = []
    }

    public init(
        sectionTitle: String? = nil,
        sectionDescription: String? = nil,
        cardsDescriptionModel: [CardModel]
    ) {
        self.sectionTitle = sectionTitle
        self.sectionDescription = sectionDescription
        self.cardsDescriptionModel = cardsDescriptionModel
        listModels = []
        pillsModel = []
    }
}
