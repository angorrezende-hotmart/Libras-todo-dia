//
//  StringExtension.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 09/08/21.
//

import Foundation

extension String {
    static var empty: String {
        ""
    }

    var digits: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }

    func currencyInputFormatting(locale: Locale) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.locale = locale

        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        let double = (digits as NSString).doubleValue
        let number = NSNumber(value: double / 100)

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number) ?? ""
    }

    static func getHMTLString(_ text: String, font: UIFont, color: UIColor) -> String {
        String(format: "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><span style=\"font-family: \(font.fontName); font-size: \(font.pointSize); color: \(color.hexString ?? "")\">%@</span>", text)
    }

    func trunc(_ length: Int, trailing: String? = "...") -> String {
        if count > length {
            return String(self[...index(startIndex, offsetBy: length - 1)]) + (trailing ?? "")
        } else {
            return self
        }
    }
}
