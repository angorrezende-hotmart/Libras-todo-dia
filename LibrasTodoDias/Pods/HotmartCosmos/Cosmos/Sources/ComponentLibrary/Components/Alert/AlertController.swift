//
//  AlertController.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 04/06/21.
//

import Foundation

final class AlertController: SystemAlertController {
    // MARK: - Properties

    private var model: AlertModel?

    // MARK: - SystemAlertController

    func makeAlert() -> UIAlertController {
        guard let model = model else {
            assertionFailure("Model was not setted")
            return UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        }

        let alertStyle: UIAlertController.Style

        switch model.style {
        case .alert:
            alertStyle = .alert
        case .actionSheet:
            alertStyle = .actionSheet
        }

        let alert = CustomUIAlertController(title: nil, message: nil, preferredStyle: alertStyle)
        alert.model = model

        return alert
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AlertModel else {
            return
        }

        self.model = model
    }
}
