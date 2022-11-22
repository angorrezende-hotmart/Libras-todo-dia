//
//  UILabelExtension.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 27/10/21.
//

import Foundation

public extension UILabel {
    func renderAsHTML(
        _ string: String,
        with font: UIFont,
        color: SystemColor,
        andTextAlignment textAlignment: NSTextAlignment = .left
    ) {
        guard !string.isEmpty else { return }

        do {
            let modifiedFont = String.getHMTLString(
                string,
                font: font,
                color: Cosmos.getUIColorBy(systemColor: color) ?? .black
            )

            guard let data = modifiedFont.data(using: .utf8) else {
                text = string
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
            paragraph.alignment = textAlignment
            attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSRange(location: .zero, length: .one))

            self.attributedText = attributedText
        } catch {
            text = string
        }
    }
}
