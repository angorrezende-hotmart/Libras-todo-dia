//
//  AcessoryModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

public struct AcessoryModel {
    public var midia: Midia

    public init(
        midia: Midia
    ) {
        self.midia = midia
    }

    public enum Midia {
        case audio(duration: String? = nil)
        case video(duration: String? = nil)
        case live(text: String? = nil)
        case text(text: String)
        case circle

        var system: SystemAcessoryMidia {
            let midiaGroup = AcessoryMidiaGroup()

            switch self {
            case .audio:
                return midiaGroup.audio
            case .video:
                return midiaGroup.video
            case .live:
                return midiaGroup.live
            case .text:
                return midiaGroup.text
            case .circle:
                return midiaGroup.circle
            }
        }
    }
}
