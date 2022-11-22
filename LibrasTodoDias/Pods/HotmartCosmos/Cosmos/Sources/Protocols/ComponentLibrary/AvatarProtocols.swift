//
//  AvatarProtocols.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/04/21.
//

import Foundation

// MARK: - Avatar

public protocol AvatarComponent {
    var style: AvatarStyleProtocol { get }
    var size: AvatarSizeProtocol { get }
}

public protocol AvatarStylesProtocol: Tokenable {
    var circle: AvatarStyleProtocol { get }
    var rounded: AvatarStyleProtocol { get }

    func getForStyle(_ style: AvatarStyle) -> AvatarStyleProtocol
}

public protocol AvatarStyleProtocol: Token {
    var style: AvatarStyle { get }
}

public protocol AvatarSizesProtocol: Tokenable {
    var xe: AvatarSizeProtocol { get }
    var xl: AvatarSizeProtocol { get }
    var lg: AvatarSizeProtocol { get }
    var md: AvatarSizeProtocol { get }
    var sm: AvatarSizeProtocol { get }
    var xs: AvatarSizeProtocol { get }
    var xxs: AvatarSizeProtocol { get }

    func getForSize(_ size: AvatarSize) -> AvatarSizeProtocol
}

public protocol AvatarSizeProtocol: Token {
    var sizeValue: CGFloat { get }
    var iconSize: CGFloat { get }
    var sizeStyles: AvatarSize { get }
    var systemFont: SystemTypography { get }
}

// MARK: - Enums

public enum AvatarStyle: String {
    case rounded = "avatar_circle"
    case circle = "avatar_rounded"
}

public enum AvatarSize: String {
    case xe = "avatar_xe"
    case xl = "avatar_xl"
    case lg = "avatar_lg"
    case md = "avatar_md"
    case sm = "avatar_sm"
    case xs = "avatar_xs"
    case xxs = "avatar_xxs"
}

public struct AvatarCircle: AvatarStyleProtocol {
    public let style: AvatarStyle = .circle
    public var tokenName: String {
        style.rawValue
    }

    public init() {}
}

public struct AvatarRounded: AvatarStyleProtocol {
    public let style: AvatarStyle = .rounded
    public var tokenName: String = "avatar_rounded"

    public init() {}
}
