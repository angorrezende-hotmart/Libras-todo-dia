//
//  AnimationTime.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/07/21.
//

import Foundation

public enum AnimationTime {
    /// 0.1 seconds
    public static let ultraFast: Double = 0.1
    /// 0.15 seconds
    public static let megaFast: Double = 0.15
    /// 0.2 seconds
    public static let veryFast: Double = 0.2
    /// 0.25 seconds
    public static let fast: Double = 0.25
    /// 0.5 seconds
    public static let recFast: Double = 0.5
    /// 1.0 seconds
    public static let recSlow: Double = 1.0
    /// 0.35 seconds
    public static let slow: Double = 0.35
    /// 0.75 seconds
    public static let slowMidle: Double = 0.75
    /// 1.0 seconds
    public static let verySlow: Double = 1.0
    /// 5.0 seconds
    public static let fire: Double = 5.0
    /// 0.4 seconds
    public static let blink: Double = 0.4
    /// 1.25 seconds
    public static let selectorVideo: Double = 1.25
    /// 12.0 seconds
    public static let long: Double = 12.0
}

public enum AnimationDuration {
    /// 0.1 seconds
    case ultraFast
    /// 0.15 seconds
    case megaFast
    /// 0.2 seconds
    case veryFast
    /// 0.25 seconds
    case fast
    /// 0.5 seconds
    case recFast
    /// 1.0 seconds
    case recSlow
    /// 0.35 seconds
    case slow
    /// 0.75 seconds
    case slowMidle
    /// 1.0 seconds
    case verySlow
    /// 5.0 seconds
    case fire
    /// 0.4 seconds
    case blink
    /// 1.25 seconds
    case selectorVideo
    /// 12.0 seconds
    case long

    var doubleValue: Double {
        switch self {
        case .ultraFast:
            return AnimationTime.ultraFast
        case .megaFast:
            return AnimationTime.megaFast
        case .fast:
            return AnimationTime.fast
        case .recFast:
            return AnimationTime.recFast
        case .slow:
            return AnimationTime.slow
        case .slowMidle:
            return AnimationTime.slowMidle
        case .verySlow:
            return AnimationTime.verySlow
        case .fire:
            return AnimationTime.fire
        case .blink:
            return AnimationTime.blink
        case .selectorVideo:
            return AnimationTime.selectorVideo
        case .long:
            return AnimationTime.long
        case .veryFast:
            return AnimationTime.veryFast
        case .recSlow:
            return AnimationTime.recSlow
        }
    }
}
