//
//  SparkleAvatarStyles.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

struct AvatarStyles: AvatarStylesProtocol {
    /// Token: `avatar_rounded`
    public let circle: AvatarStyleProtocol = AvatarCircle()

    /// Token: `avatar_circle`
    public let rounded: AvatarStyleProtocol = AvatarRounded()

    func getForStyle(_ size: AvatarStyle) -> AvatarStyleProtocol {
        switch size {
        case .rounded:
            return rounded
        case .circle:
            return circle
        }
    }

    func getToken(_ tokenName: String) -> Token? {
        guard let style = AvatarStyle(rawValue: tokenName) else {
            return nil
        }

        return getForStyle(style)
    }
}
