//
//  ListComponentItemView.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 24/06/21.
//

import UIKit

final class ListComponentItemView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static var textFont: UIFont {
            Cosmos.typography.body.text1.font
        }

        static var textColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral400.color
        }
    }

    // MARK: - Constraints

    private lazy var widthConstraint: NSLayoutConstraint = {
        let constraint = button.widthAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    private lazy var heightConstraint: NSLayoutConstraint = {
        let constraint = button.heightAnchor.constraint(equalToConstant: .zero)
        return constraint
    }()

    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = Spacing().spacing4.value
        }.build()

        return stackView
    }()

    private let textLabel: UILabel = {
        let view = UILabel()
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    private lazy var button: UIButton = {
        let view = UIButton()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return view
    }()

    // MARK: - Properties

    private var viewModel: ListComponentItemModel?
    private var action: ((ListComponentItemAction) -> Void)?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(textLabel)
        mainStackView.addArrangedSubview(button)
    }

    override func constrainSubviews() {
        mainStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        textLabel.font = Constants.textFont
        textLabel.textColor = Constants.textColor

        guard let systemColor = viewModel?.image?.tintColor?() else { return }
        button.tintColor = Cosmos.getUIColorBy(systemColor: systemColor)
    }

    // MARK: - Private Methods

    private func setupButton(_ viewModel: ListComponentItemModel) {
        let inactiveImage = viewModel.image?.inactiveImage ?? viewModel.image?.defaultImage
        let activeImage = viewModel.image?.activeImage

        button.isHidden = false
        button.setImage(inactiveImage, for: .normal)
        button.setImage(activeImage, for: .selected)
        button.imageView?.contentMode = .center

        if viewModel.hasClickableArea {
            let iconMargin = Spacing().spacing3.value
            button.contentEdgeInsets = .init(top: iconMargin, left: iconMargin, bottom: iconMargin, right: iconMargin)
        } else {
            button.contentEdgeInsets = .init(top: .zero, left: .zero, bottom: .zero, right: .zero)
        }
    }

    private func setupComponent(_ view: UIView) {
        view.subviews.forEach { $0.setContentHuggingPriority(.required, for: .horizontal) }
        mainStackView.addArrangedSubview(view)
    }

    private func setupTextLabel(_ text: String) {
        textLabel.isHidden = false
        textLabel.text = text
    }

    private func cleanView() {
        mainStackView.subviews.forEach {
            if $0 != button && $0 != textLabel {
                $0.removeFromSuperview()
            }
        }

        button.isSelected = false
        button.isHidden = true
        textLabel.isHidden = true
    }

    @objc private func buttonClicked(_ sender: UIButton) {
        guard let model = viewModel else { return }
        let isActive = !model.isActive
        action?(.tap(isActive: isActive))
        handleSelected(isSelected: isActive)
    }

    func handleSelected(isSelected: Bool) {
        guard let model = viewModel else { return }

        viewModel?.isActive = isSelected
        if case .rotation = model.animation {
            rotateButton(button) { [weak self] in
                self?.button.isSelected = isSelected
            }
        } else {
            button.isSelected = isSelected
        }
    }

    private func rotateButton(_ button: UIButton, completion: @escaping () -> Void) {
        UIView.animation(
            withDuration: .recFast,
            animations: {
                button.transform = CGAffineTransform(rotationAngle: self.viewModel?.isActive == false ? .zero : .pi)
            }, completion: { _ in
                completion()
            }
        )
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ListComponentItemModel else {
            return
        }

        cleanView()

        self.viewModel = model
        button.isSelected = model.isActive

        if let text = model.text {
            setupTextLabel(text)
        }

        if let componentView = model.componentStyle?.getView() {
            setupComponent(componentView)
        } else {
            setupButton(model)
        }

        configurateColors()
    }

    func bindAction(_ externalAction: ((ListComponentItemAction) -> Void)?) {
        action = { listAction in
            externalAction?(listAction)
        }
    }
}
