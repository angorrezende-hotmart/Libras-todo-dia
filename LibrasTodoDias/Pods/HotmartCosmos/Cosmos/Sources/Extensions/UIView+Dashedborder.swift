//
//  UIView+Dashedborder.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 27/04/22.
//

import Foundation

extension UIView {
    func addDashedBorder(
        strokeColor: UIColor,
        fillColor: UIColor,
        cornerRadius: CGFloat,
        dashPattern: [NSNumber] = [10, 4],
        customWidth: CGFloat? = nil,
        customHeight: CGFloat? = nil
    ) {
        let width = customWidth ?? frame.width
        let height = customHeight ?? frame.height

        let borderFrame = CGRect(x: .zero, y: .zero, width: width, height: height)

        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = .one
        dashBorder.strokeColor = strokeColor.cgColor
        dashBorder.lineDashPattern = dashPattern
        dashBorder.frame = borderFrame
        dashBorder.fillColor = fillColor.cgColor

        let cornerRadius: CGFloat = cornerRadius
        if cornerRadius > .zero {
            dashBorder.path = UIBezierPath(roundedRect: borderFrame, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }

        layer.addSublayer(dashBorder)
    }

    func clearDashedBorder() {
        layer.sublayers?.filter { $0 is CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
    }
}
