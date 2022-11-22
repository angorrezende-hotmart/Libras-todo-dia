//
//  TextualContentModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

import Foundation

public struct TextualContentModel: CosmosModel {
    public var title: String
    public var titleStyle: TitleStyle?
    public var isVerified: Bool
    public var style: Style

    public init(
        title: String,
        titleStyle: TitleStyle? = nil,
        isVerified: Bool = false,
        style: Style
    ) {
        self.title = title
        self.titleStyle = titleStyle
        self.isVerified = isVerified
        self.style = style
    }

    public enum Style {
        case listDesc1
        case listDesc2(description: String? = nil, descriptionStyle: DescriptionStyle? = nil)

        func getSystem() -> SystemTextualContent {
            let group = TextualContentGroup()
            switch self {
            case .listDesc1:
                return group.listDesc1
            case .listDesc2:
                return group.listDesc2
            }
        }
    }

    public struct TitleStyle {
        var typography: Typography
        var color: Color?

        public init(
            typography: Typography,
            color: Color? = nil
        ) {
            self.typography = typography
            self.color = color
        }

        public enum Typography {
            case text2
            case text3
            case text1Strong
            case text2Strong
            case text3Strong

            func getSystemTypography() -> SystemTypography {
                switch self {
                case .text2:
                    return Cosmos.typography.body.text2
                case .text3:
                    return Cosmos.typography.body.text3
                case .text1Strong:
                    return Cosmos.typography.bodyStrong.text1Strong
                case .text2Strong:
                    return Cosmos.typography.bodyStrong.text2Strong
                case .text3Strong:
                    return Cosmos.typography.bodyStrong.text3Strong
                }
            }
        }

        public enum Color {
            case neutral
            case gray

            func getSystemColor() -> SystemColor {
                switch self {
                case .neutral:
                    return Cosmos.colors.productColors.neutralProductColor.neutral900
                case .gray:
                    return Cosmos.colors.productColors.neutralProductColor.neutral400
                }
            }
        }
    }

    public struct DescriptionStyle {
        var typography: Typography
        var color: Color
        let numberOfLines: Int

        public init(
            typography: Typography,
            color: Color,
            numberOfLines: Int = 0
        ) {
            self.typography = typography
            self.color = color
            self.numberOfLines = numberOfLines
        }

        public enum Typography {
            case text1
            case text3
            case text2Strong
            case text3Strong

            func getSystemTypography() -> SystemTypography {
                switch self {
                case .text1:
                    return Cosmos.typography.body.text1
                case .text3:
                    return Cosmos.typography.body.text3
                case .text2Strong:
                    return Cosmos.typography.bodyStrong.text2Strong
                case .text3Strong:
                    return Cosmos.typography.bodyStrong.text3Strong
                }
            }
        }

        public enum Color {
            case neutral
            case green

            func getSystemColor() -> SystemColor {
                switch self {
                case .neutral:
                    return Cosmos.colors.productColors.neutralProductColor.neutral600
                case .green:
                    return Cosmos.colors.productColors.greenProductColor.color
                }
            }
        }
    }
}
