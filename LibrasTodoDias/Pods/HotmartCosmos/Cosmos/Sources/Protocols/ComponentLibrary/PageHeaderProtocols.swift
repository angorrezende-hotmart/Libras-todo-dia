//
//  PageHeaderProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 22/10/21.
//

import Foundation

// MARK: - Content

public protocol SystemHeaderContentGroup {
    var headerDesc: SystemHeaderContent { get }
    var headerDescTag: SystemHeaderContent { get }
}

public protocol SystemHeaderContent: Token {
    var typography: SystemHeaderContentTypography { get }
    var colors: SystemHeaderContentColors { get }
    var spacing: SystemHeaderContentSpacing { get }
}

public protocol SystemHeaderContentTypography {
    var title: SystemTypography { get }
    var description: SystemTypography { get }
}

public protocol SystemHeaderContentColors {
    var title: SystemColor { get }
    var description: SystemColor { get }
}

public protocol SystemHeaderContentSpacing {
    var betweenAvatarAndTitle: CGFloat { get }
    var betweenTitleAndDescription: CGFloat { get }
}

// MARK: - Plates

public protocol SystemHeaderPlatesGroup {
    var headerPlates: SystemHeaderPlates { get }
}

public protocol SystemHeaderPlates: Token {
    var typography: SystemHeaderPlatesTypography { get }
    var colors: SystemHeaderPlatesColors { get }
    var spacing: SystemHeaderPlatesSpacing { get }
    var sizes: SystemHeaderPlatesSizes { get }
}

public protocol SystemHeaderPlatesTypography {
    var name: SystemTypography { get }
}

public protocol SystemHeaderPlatesColors {
    var name: SystemColor { get }
    var icon: SystemColor { get }
}

public protocol SystemHeaderPlatesSpacing {
    var betweenPlates: CGFloat { get }
    var leadingAndTrailing: CGFloat { get }
}

public protocol SystemHeaderPlatesSizes {
    var icon: ImageSize { get }
}
