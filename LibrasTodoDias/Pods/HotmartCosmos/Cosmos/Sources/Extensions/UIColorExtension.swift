//
//  UIColorExtension.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 26/08/21.
//

import Foundation

extension UIColor {
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        } else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }

    var name: String? {
        let str = String(describing: self).dropLast()
        guard let nameRange = str.range(of: "name = ") else {
            return nil
        }
        let cropped = str[nameRange.upperBound ..< str.endIndex]
        if cropped.isEmpty {
            return nil
        }
        return String(cropped)
    }

    var redValue: CGFloat { CIColor(color: self).red }
    var greenValue: CGFloat { CIColor(color: self).green }
    var blueValue: CGFloat { CIColor(color: self).blue }
    var alphaValue: CGFloat { CIColor(color: self).alpha }

    var redValueFormatted: String { String(format: "%.2f", ceil(redValue * 255.0)) }
    var greenValueFormatted: String { String(format: "%.2f", ceil(redValue * 255.0)) }
    var blueValueFormatted: String { String(format: "%.2f", ceil(redValue * 255.0)) }
}
