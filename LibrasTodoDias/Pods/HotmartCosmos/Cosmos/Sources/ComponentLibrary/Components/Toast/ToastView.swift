//
//  ToastView.swift
//  HotmartCosmos
//
//  Created by Felipe Freitas Vieira Campidelli on 14/03/22.
//

import Foundation
import UIKit

final class ToastView: ThemedCodedView, Bindable {
    // MARK: - Constants

    let toast = Toast()

    private enum Constants {
        static let iconSpacing: CGFloat = 12
        static let borderRadius: CGFloat = 8
        static let iconSize = CGSize(width: 20, height: 15)
        static let indicatorSize = CGSize(width: 16, height: 9)

        enum Padding {
            static let top: CGFloat = 12
            static let leading: CGFloat = 16
            static let bottom: CGFloat = 12
            static let trailing: CGFloat = 16
        }
    }

    private enum Durations {
        static let fast: CGFloat = 2
        static let medium: CGFloat = 4
        static let slow: CGFloat = 6
    }

    // MARK: - Properties

    private var model: ToastModel?
    private var action: ((ToastAction) -> Void)?

    // MARK: - View Elements
    
    private var triangleView: TriangleView = {
        let size = Constants.indicatorSize
        let view = TriangleView(frame: .init(x: .zero, y: .zero, width: size.width, height: size.height))
        view.backgroundColor = .clear
        return view
    }()

    private lazy var toastView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.borderRadius
        return view
    }()

    private lazy var spacingView = UIView()

    private lazy var toastLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = toast.textTypography.font
        label.textColor = toast.textColor.color
        return label
    }()

    private lazy var iconView = UIImageView()

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(toastView)
        toastView.addSubview(spacingView)
        toastView.addSubview(triangleView)
        spacingView.addSubview(toastLabel)
    }

    override func constrainSubviews() {
        constrainToastView()
        constrainSpacingView()
        constraintTriangleView()
    }

    override func configurateColors() {
        backgroundColor = .clear
    }

    // MARK: - Constraints

    private func constrainToastView() {
        toastView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    private func constrainSpacingView() {
        spacingView.anchor(
            top: toastView.topAnchor,
            leading: toastView.leadingAnchor,
            bottom: toastView.bottomAnchor,
            trailing: toastView.trailingAnchor,
            topConstant: Constants.Padding.top,
            leadingConstant: Constants.Padding.leading,
            bottomConstant: Constants.Padding.bottom,
            trailingConstant: Constants.Padding.trailing
        )
    }

    private func constrainToastLabel() {
        toastLabel.anchor(
            top: spacingView.topAnchor,
            leading: spacingView.leadingAnchor,
            bottom: spacingView.bottomAnchor,
            trailing: spacingView.trailingAnchor
        )
    }

    private func constrainIconView() {
        toastLabel.anchor(
            top: spacingView.topAnchor,
            bottom: spacingView.bottomAnchor,
            trailing: spacingView.trailingAnchor
        )

        iconView.anchor(
            top: spacingView.topAnchor,
            left: spacingView.leftAnchor,
            bottom: spacingView.bottomAnchor,
            right: toastLabel.leftAnchor,
            rightConstant: Constants.iconSpacing,
            widthConstant: Constants.iconSize.width,
            heightConstant: Constants.iconSize.height
        )
    }
    
    private func constraintTriangleView() {
        let size = Constants.indicatorSize
        
        triangleView.anchor(
            bottom: toastView.topAnchor,
            widthConstant: size.width,
            heightConstant: size.height
        )
        triangleView.anchorCenterXToSuperview()
    }

    // MARK: - BindViewModel

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ToastModel else { return }

        self.model = model
        toastLabel.text = model.text
        triangleView.isHidden = !model.indicator
        
        configureStyle(model.style)
        configureDisplayTime(model.time)
        configureIcon(icon: model.icon)
    }

    func bindAction(_ action: ((ToastAction) -> Void)?) {
        self.action = { buttonAction in
            action?(buttonAction)
        }
    }

    // MARK: - Private Methods

    private func configureStyle(_ style: ToastModel.Style) {
        switch style {
        case .default:
            toastView.backgroundColor = toast.defaultColor.color
            triangleView.setFillColor(toast.defaultColor.color)
        case .success:
            toastView.backgroundColor = toast.successColor.color
            triangleView.setFillColor(toast.successColor.color)
        case .warning:
            toastView.backgroundColor = toast.warningColor.color
            triangleView.setFillColor(toast.warningColor.color)
        case .danger:
            toastView.backgroundColor = toast.dangerColor.color
            triangleView.setFillColor(toast.dangerColor.color)
        }
    }

    private func configureIcon(icon: ToastModel.IconStyle) {
        switch icon {
        case .left(let icon):
            iconView.image = Cosmos.iconSet(imageType: icon, size: .medium)
            iconView.tintColor = toast.textColor.color
            spacingView.addSubview(iconView)
            constrainIconView()
        default:
            constrainToastLabel()
        }
    }

    private func configureDisplayTime(_ time: ToastModel.Time) {
        switch time {
        case .fast:
            hideToast(time: Durations.fast)
        case .medium:
            hideToast(time: Durations.medium)
        case .slow:
            hideToast(time: Durations.slow)
        case .custom(let seconds):
            hideToast(time: seconds)
        default:
            break
        }
    }

    private func hideToast(time: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.action?(.didDisappear)
            self.removeFromSuperview()
        }
    }
}
