//
//  CardProtocols.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

protocol SystemCardImage: Token {
    var proportion: CGFloat { get }
    var resolution: CardResolution { get }
}

protocol SystemCardImageGroup {
    var img1: SystemCardImage { get }
    var img2: SystemCardImage { get }
    var img3: SystemCardImage { get }
    var img4: SystemCardImage { get }
}

protocol SystemCardDescripton: Token {
    var titleTypography: SystemTypography { get }
    var titleColor: SystemColor { get }
    var authorTypography: SystemTypography { get }
    var authorColor: SystemColor { get }
    var priceTypography: SystemTypography? { get }
    var priceColor: SystemColor? { get }
    var promotionTypography: SystemTypography? { get }
    var promotionColor: SystemColor? { get }
    var buttonModel: ButtonModel? { get }
}

enum CardResolution {
    case squared
    case wide
    case ultraWide
    case portrait
}

protocol SystemOutlinedCardGroup {
    var `default`: SystemOutlinedCard { get }
    var shortAction: SystemOutlinedCard { get }
}

protocol SystemOutlinedCard: Token {
    var sizes: SystemOutlinedCardSizes { get }
    var metrics: SystemOutlinedCardMetrics { get }
    var typography: SystemOutlinedCardTypography { get }
    var colors: SystemOutlinedCardColor { get }
}

protocol SystemOutlinedCardSizes {
    var small: SystemOutlinedCardSize { get }
    var medium: SystemOutlinedCardSize { get }
    var big: SystemOutlinedCardSize { get }
    var flex: SystemOutlinedCardSize { get }

    func getForSize(_ size: OutlinedCardSize) -> SystemOutlinedCardSize
}

protocol SystemOutlinedCardSize {
    var width: CGFloat { get }
}

public enum OutlinedCardSize {
    case small
    case medium
    case big
    case flex
}

protocol SystemOutlinedCardMetrics {
    var strokeSize: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var contentSpacing: CGFloat { get }
    var spacingBetweenIconAndTitle: CGFloat { get }
    var spacingBetweenTitleAndDescription: CGFloat { get }
}

protocol SystemOutlinedCardTypography {
    var title: SystemTypography { get }
    var description: SystemTypography { get }
}

protocol SystemOutlinedCardColor {
    var icon: SystemColor { get }
    var title: SystemColor { get }
    var description: SystemColor { get }
    var background: SystemColor { get }
    var stroke: SystemColor { get }
}
