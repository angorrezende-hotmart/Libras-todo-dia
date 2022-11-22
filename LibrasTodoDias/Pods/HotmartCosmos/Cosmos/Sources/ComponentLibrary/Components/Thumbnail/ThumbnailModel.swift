//
//  ThumbnailModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

public struct ThumbnailModel: CosmosModel {
    public var resolution: ThumbnailResolution
    public var size: ThumbnailSize
    public var accesoryStyle: AcessoryModel.Midia?
    public var placeholder: UIImage?
    public var imageUrlString: String?
    public var requestBuilder: CosmosMediaRequestBuilding?
    public var imageContentMode: UIView.ContentMode?
    public var borderColor: (() -> UIColor)?
    public var style: Style

    public init(
        resolution: ThumbnailResolution,
        size: ThumbnailSize,
        accesoryStyle: AcessoryModel.Midia? = nil,
        placeholder: UIImage?,
        imageUrlString: String? = nil,
        requestBuilder: CosmosMediaRequestBuilding? = nil,
        imageContentMode: UIView.ContentMode? = nil,
        borderColor: (() -> UIColor)? = nil,
        style: Style = .normal()
    ) {
        self.resolution = resolution
        self.size = size
        self.accesoryStyle = accesoryStyle
        self.placeholder = placeholder
        self.imageUrlString = imageUrlString
        self.requestBuilder = requestBuilder
        self.imageContentMode = imageContentMode
        self.borderColor = borderColor
        self.style = style
    }

    public enum Style {
        case normal(padding: CGFloat = .zero)
        case innerImage(backgroundColor: UIColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color)
    }
}
