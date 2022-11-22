//
//  UIStackViewExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 13/05/21.
//

import UIKit

extension UIStackView {
    func addSpacingView() {
        let view = UIView()
        addArrangedSubview(view)
    }

    func addSpacingViewOfHeight(_ height: CGFloat) {
        let view = UIView()
        view.layout(using: [
            view.heightAnchor.constraint(equalToConstant: height),
        ])
        addArrangedSubview(view)
    }

    func addSpacingViewOfWidth(_ height: CGFloat) {
        let view = UIView()
        view.layout(using: [
            view.widthAnchor.constraint(equalToConstant: height),
        ])
        addArrangedSubview(view)
    }

    func removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
