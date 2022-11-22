//
//  PaginationModel.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 27/01/22.
//

public struct PaginationModel: CosmosModel {
    public var numberOfPages: Int
    public var currentPage: Int
    public var style: Style

    public init(
        numberOfPages: Int,
        currentPage: Int = .zero,
        style: Style
    ) {
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
        self.style = style
    }

    // MARK: - Enums

    public enum Style: String {
        case `default`
        case white
        case black
    }

    public func getSystemPagination() -> SystemPagination {
        let paginationGroup = PaginationGroup()
        switch style {
        case .default:
            return paginationGroup.default
        case .white:
            return paginationGroup.white
        case .black:
            return paginationGroup.black
        }
    }

    public func getTokenName() -> String {
        "pag_" + style.rawValue
    }
}

public enum PaginationAction: CosmosAction {
    case paginationTap(_ page: Int)
}
