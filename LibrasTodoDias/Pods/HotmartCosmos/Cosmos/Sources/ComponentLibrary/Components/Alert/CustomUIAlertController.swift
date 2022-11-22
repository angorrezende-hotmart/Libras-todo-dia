//
//  CustomUIAlertController.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 27/09/21.
//

import Foundation

final class CustomUIAlertController: UIAlertController {
    // MARK: - Constants

    private enum Constants {
        static let titleAttributedKey: String = "attributedTitle"
        static let messageAttributedKey: String = "attributedMessage"
    }

    // MARK: - Properties

    var model: AlertModel?

    // MARK: - Life Cycle

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateVisual()
    }

    // MARK: - Private methods

    private func updateVisual() {
        guard let model = model else {
            assertionFailure("Model was not setted")
            return
        }

        let alertSystem = model.style.getSystem()

        if let title = model.title {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: alertSystem.titleColor,
                .font: alertSystem.titleTypography.font,
            ]

            let attributedTitle = NSAttributedString(
                string: title,
                attributes: attributes
            )

            setValue(attributedTitle, forKey: Constants.titleAttributedKey)
        }

        if model.description != nil {
            setHTMLDescription(model)
        }

        view.tintColor = alertSystem.buttonColor
    }

    private func setNormalDescription(_ model: AlertModel) {
        let alertSystem = model.style.getSystem()

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: alertSystem.descriptionColor,
            .font: alertSystem.descriptionTypography.font,
        ]

        let attributedDescription = NSAttributedString(
            string: description,
            attributes: attributes
        )

        setValue(attributedDescription, forKey: Constants.messageAttributedKey)
    }

    private func setHTMLDescription(_ model: AlertModel) {
        guard let description = model.description else {
            return
        }

        let alertSystem = model.style.getSystem()

        do {
            let modifiedFont = String.getHMTLString(
                description,
                font: alertSystem.descriptionTypography.font,
                color: alertSystem.descriptionColor
            )

            guard let data = modifiedFont.data(using: .utf8) else {
                setNormalDescription(model)
                return
            }

            let attributedText = try NSMutableAttributedString(
                data: data,
                options: [
                    NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                ],
                documentAttributes: nil
            )

            let paragraph = NSMutableParagraphStyle()
            attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSRange(location: .zero, length: .one))

            setValue(attributedText, forKey: Constants.messageAttributedKey)
        } catch {
            setNormalDescription(model)
        }
    }
}
