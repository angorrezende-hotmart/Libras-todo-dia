//
//  BottomSheetHeaderViewModel.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

struct BottomSheetHeaderViewModel: CosmosModel {
    var image: UIImage?
    var title: String?
    var subtitle: String?
    var description: String?
    var style: Style
    var titleFont: SystemTypography?

    init(
        image: UIImage? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        style: Style,
        titleFont: SystemTypography? = nil
    ) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.style = style
        self.titleFont = titleFont
    }

    enum Style {
        case centered
        case leading
    }
}
