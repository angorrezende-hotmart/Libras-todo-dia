//
//  StepperModel.swift
//  Alamofire
//
//  Created by Douglas Seabra Pedrosa on 21/02/22.
//

import Foundation

public struct StepperModel: CosmosModel {
    public var style: Style
    public var status: Status
    public var position: Position
    public var color: () -> UIColor
    public var title: String
    public var subtitle: String?

    public init(
        style: Style,
        status: Status,
        position: Position,
        color: @escaping () -> UIColor,
        title: String,
        subtitle: String? = nil
    ) {
        self.style = style
        self.status = status
        self.position = position
        self.color = color
        self.title = title
        self.subtitle = subtitle
    }

    public enum Style: Equatable {
        case horizontal
        case vertical(HorizontalDataType)
    }

    public enum Status: Equatable {
        case done
        case current
        case next
    }

    public enum Position: Equatable {
        case first
        case middle
        case last
    }

    public enum HorizontalDataType: Equatable {
        case `default`
        case button(title: String)
        case progressBar(progress: Float) // 0.0 .. 1.0, default is 0.0. values outside are pinned.
    }
}

public enum StepperAction: CosmosAction {
    case buttonTap
}
