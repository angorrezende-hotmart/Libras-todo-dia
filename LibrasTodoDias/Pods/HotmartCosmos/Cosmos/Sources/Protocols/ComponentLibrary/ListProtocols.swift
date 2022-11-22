//
//  ListProtocols.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import UIKit

public protocol SystemListGroup {
    var controlAction: SystemControlList { get }
    var `default`: SystemList { get }
    var image: SystemList { get }

    func allList() -> [SystemList]
}

public protocol SystemImageList {
    var image: SystemList { get }
    var imageIcon: SystemList { get }
    var imageButton: SystemList { get }
}

public protocol SystemDefaultList {
    var simple: SystemList { get }
    var tag: SystemList { get }
    var leftIcon: SystemList { get }
    var leftIconTag: SystemList { get }
    var rightIcon: SystemList { get }
}

public protocol SystemControlList {
    var controlActionLeft: SystemList { get }
    var controlSwitch: SystemList { get }
    var controlActionLeftRight: SystemList { get }
    var controlAccordion: SystemList { get }
}

public protocol SystemList {
    var margins: SystemListMargins { get }
    var tokenName: String { get }
}

public protocol SystemListSizes {
    var icon: CGSize? { get }
}

public protocol SystemListMargins {
    var topMargin: CGFloat { get }
    var bottomMargin: CGFloat { get }
    var leadingMargin: CGFloat { get }
    var trailingMargin: CGFloat { get }
    var horizontalSpacingBetweenItems: CGFloat { get }
}

protocol SystemTextualContent: Token {
    var titleTypography: SystemTypography { get }
    var titleColor: SystemColor { get }
    var descriptionTypography: SystemTypography? { get }
    var descriptionColor: SystemColor? { get }
}
