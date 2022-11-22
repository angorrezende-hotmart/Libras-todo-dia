//
//  UIViewExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/06/21.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    class func animation(withDuration duration: AnimationDuration, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        animate(withDuration: duration.doubleValue, animations: animations, completion: completion)
    }

    class func animation(withDuration duration: AnimationDuration, animations: @escaping () -> Void) {
        animate(withDuration: duration.doubleValue, animations: animations)
    }

    class func delay(_ time: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            completion()
        }
    }

    class func delay(_ animationTime: AnimationDuration, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime.doubleValue) {
            completion()
        }
    }

    func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
