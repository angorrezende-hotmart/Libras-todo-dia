//
//  ThumbnailProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

public protocol ThumbnailComponent {
    var resolution: ThumbnailResolutionProtocol { get }
    var size: ThumbnailSizeProtocol { get }
}

public protocol ThumbnailResolutionsProtocol: Tokenable {
    var res16x9: ThumbnailResolutionProtocol { get }
    var res1x1: ThumbnailResolutionProtocol { get }

    func getForResolution(_ resolution: ThumbnailResolution) -> ThumbnailResolutionProtocol
}

public protocol ThumbnailResolutionProtocol: Token {
    var resolution: ThumbnailResolution { get }
}

public protocol ThumbnailSizesProtocol: Tokenable {
    var xl: ThumbnailSizeProtocol { get }
    var lg: ThumbnailSizeProtocol { get }
    var md: ThumbnailSizeProtocol { get }
    var sm: ThumbnailSizeProtocol { get }

    func getForSize(_ size: ThumbnailSize) -> ThumbnailSizeProtocol
}

public protocol ThumbnailSizeProtocol: Token {
    var resolution: ThumbnailResolution { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
}

// MARK: - Enums

public enum ThumbnailResolution: String {
    case res16x9 = "thumbnail_16x9"
    case res1x1 = "thumbnail_1x1"
    case res3x4 = "thumbnail_3x4"
    case res4x5 = "thumbnail_4x5"
    case res9x13 = "thumbnail_9x13"
}

public enum ThumbnailSize {
    case xl
    case lg
    case md
    case sm
    case custom(width: CGFloat)

    func getToken() -> String {
        switch self {
        case .xl:
            return "thumbnail_xl"
        case .lg:
            return "thumbnail_lg"
        case .md:
            return "thumbnail_md"
        case .sm:
            return "thumbnail_sm"
        case .custom:
            return "thumbnail_custom_width"
        }
    }

    static func getSizeFrom(_ token: String) -> ThumbnailSize {
        switch token {
        case "thumbnail_xl":
            return .xl
        case "thumbnail_lg":
            return .lg
        case "thumbnail_md":
            return .md
        case "thumbnail_sm":
            return .sm
        default:
            return .custom(width: .zero)
        }
    }
}

public struct Thumbnail16x9: ThumbnailResolutionProtocol {
    public let resolution: ThumbnailResolution = .res16x9
    public var tokenName: String = "thumbnail_16x9"

    public init() {}
}

public struct Thumbnail1x1: ThumbnailResolutionProtocol {
    public let resolution: ThumbnailResolution = .res1x1
    public var tokenName: String = "thumbnail_1x1"

    public init() {}
}

public struct Thumbnail3x4: ThumbnailResolutionProtocol {
    public let resolution: ThumbnailResolution = .res3x4
    public var tokenName: String = "thumbnail_3x4"

    public init() {}
}

public struct Thumbnail4x5: ThumbnailResolutionProtocol {
    public let resolution: ThumbnailResolution = .res4x5
    public var tokenName: String = "thumbnail_4x5"

    public init() {}
}

public struct Thumbnail9x13: ThumbnailResolutionProtocol {
    public let resolution: ThumbnailResolution = .res9x13
    public var tokenName: String = "thumbnail_9x13"

    public init() {}
}
