//
//  TriangleView.swift
//  HotmartCosmos
//
//  Created by rafael.barbosa on 14/11/22.
//

import UIKit

final class TriangleView: UIView {

    private var fillColor: UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
        context.closePath()
        context.setFillColor(fillColor?.cgColor ?? UIColor.black.cgColor)
        context.fillPath()
    }
    
    func setFillColor(_ color: UIColor) {
        fillColor = color
        setNeedsDisplay()
    }
}
