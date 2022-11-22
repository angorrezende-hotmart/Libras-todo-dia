//
//  BottomSheetFooterViewModel.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

struct BottomSheetFooterViewModel: CosmosModel {
    let style: Style

    init(
        style: Style
    ) {
        self.style = style
    }

    enum Style {
        case text(primaryButtonText: String?, secondaryButtonText: String?, tertiaryButtonText: String?)
        case model(firstButtonModel: ButtonModel?, secondButtonModel: ButtonModel?, thirdButtonModel: ButtonModel?)
    }
}

enum BottomSheetFooterViewAction: CosmosAction {
    case primaryButtonTap(text: String)
    case secondaryButtonTap(text: String)
    case tertiaryButtonTap(text: String)
    case customButtonTap(model: ButtonModel)
}
