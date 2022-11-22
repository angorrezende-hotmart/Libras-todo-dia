//
//  ThumbnailResolutions.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

struct ThumbnailResolutions: ThumbnailResolutionsProtocol {
    /// Token: `thumbnail_16x9`
    public let res16x9: ThumbnailResolutionProtocol = Thumbnail16x9()

    /// Token: `thumbnail_1x1`
    public let res1x1: ThumbnailResolutionProtocol = Thumbnail1x1()

    /// Token: `thumbnail_3x4`
    public let res3x4: ThumbnailResolutionProtocol = Thumbnail3x4()

    /// Token: `thumbnail_4x5`
    public let res4x5: ThumbnailResolutionProtocol = Thumbnail4x5()

    /// Token: `thumbnail_9x13`
    public let res9x13: ThumbnailResolutionProtocol = Thumbnail9x13()

    func getForResolution(_ size: ThumbnailResolution) -> ThumbnailResolutionProtocol {
        switch size {
        case .res16x9:
            return res16x9
        case .res1x1:
            return res1x1
        case .res3x4:
            return res3x4
        case .res4x5:
            return res4x5
        case .res9x13:
            return res9x13
        }
    }

    func getToken(_ tokenName: String) -> Token? {
        guard let style = ThumbnailResolution(rawValue: tokenName) else {
            return nil
        }

        return getForResolution(style)
    }
}
