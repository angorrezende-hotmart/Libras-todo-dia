//
//  ThumbnailSizes.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

public struct ThumbnailSizes: ThumbnailSizesProtocol {
    public let resolution: ThumbnailResolution
    public var customWidth: CGFloat?

    /// Token: `thumbnail_xl` Width: `156.0`
    public var xl: ThumbnailSizeProtocol {
        XL(resolution: resolution)
    }

    /// Token: `thumbnail_lg` Width: `140.0`
    public var lg: ThumbnailSizeProtocol {
        LG(resolution: resolution)
    }

    /// Token: `thumbnail_xl` Width: `100.0`
    public var md: ThumbnailSizeProtocol {
        MD(resolution: resolution)
    }

    /// Token: `thumbnail_sm` Width: `72.0`
    public var sm: ThumbnailSizeProtocol {
        SM(resolution: resolution)
    }

    // MARK: - Sizes Declaration

    struct XL: ThumbnailSizeProtocol {
        var resolution: ThumbnailResolution
        var tokenName: String = "thumbnail_xl"
        var width: CGFloat = 156.0
        var height: CGFloat {
            getHeightBy(resolution: resolution, and: width)
        }
    }

    struct LG: ThumbnailSizeProtocol {
        var resolution: ThumbnailResolution
        var tokenName: String = "thumbnail_lg"
        var width: CGFloat = 140.0
        var height: CGFloat {
            getHeightBy(resolution: resolution, and: width)
        }
    }

    struct MD: ThumbnailSizeProtocol {
        var resolution: ThumbnailResolution
        var tokenName: String = "thumbnail_md"
        var width: CGFloat = 100.0
        var height: CGFloat {
            getHeightBy(resolution: resolution, and: width)
        }
    }

    struct SM: ThumbnailSizeProtocol {
        var resolution: ThumbnailResolution
        var tokenName: String = "thumbnail_sm"
        var width: CGFloat = 72.0
        var height: CGFloat {
            getHeightBy(resolution: resolution, and: width)
        }
    }

    struct Custom: ThumbnailSizeProtocol {
        var resolution: ThumbnailResolution
        var tokenName: String = "thumbnail_custom_width"
        var width: CGFloat
        var height: CGFloat {
            getHeightBy(resolution: resolution, and: width)
        }
    }

    // MARK: - Public Init

    public init(for resolution: ThumbnailResolution) {
        self.resolution = resolution
    }

    // MARK: - Public Methods

    public func getForSize(_ size: ThumbnailSize) -> ThumbnailSizeProtocol {
        switch size {
        case .xl:
            return xl
        case .lg:
            return lg
        case .md:
            return md
        case .sm:
            return sm
        case let .custom(width):
            return Custom(resolution: resolution, width: width)
        }
    }

    public func getToken(_ tokenName: String) -> Token? {
        let size = ThumbnailSize.getSizeFrom(tokenName)
        return getForSize(size)
    }

    private static func getHeightBy(resolution: ThumbnailResolution, and width: CGFloat) -> CGFloat {
        switch resolution {
        case .res16x9:
            return (width * (9 / 16))
        case .res1x1:
            return width
        case .res3x4:
            return (width * (4 / 3))
        case .res4x5:
            return (width * (5 / 4))
        case .res9x13:
            return (width * (13 / 9))
        }
    }
}
