//
//  BottomSheetFooterView.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

final class BottomSheetFooterView: CodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let horizontalSpacing: CGFloat = 18.0
    }

    // MARK: - Cosmos Components

    private let firstButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private let secondButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private let thirdButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    // MARK: - View Elements

    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill
            $0.alignment = .center
        }.build()

        return stackView
    }()

    private lazy var firstButton: UIView = firstButtonComponent.view()

    private lazy var secondButton: UIView = secondButtonComponent.view()

    private lazy var thirdButton: UIView = thirdButtonComponent.view()

    // MARK: - Private Properties

    private var action: ((BottomSheetFooterViewAction) -> Void)?

    // MARK: - Coded View

    override func addSubviews() {
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        addSubview(stackView)
    }

    override func constrainSubviews() {
        constrainButton(firstButton)
        constrainButton(secondButton)
        constrainButton(thirdButton)

        stackView.fillSuperview()
    }

    private func constrainButton(_ view: UIView) {
        view.anchor(
            leading: leadingAnchor,
            trailing: trailingAnchor,
            leadingConstant: Constants.horizontalSpacing,
            trailingConstant: Constants.horizontalSpacing
        )
    }

    // MARK: - Private Properties

    private func configureButton(
        _ button: Component<ButtonModel, ButtonAction>,
        withModel model: ButtonModel?
    ) {
        guard let model = model else {
            return
        }

        button.update(model)

        button.onEvent? { [weak self] action in
            guard let buttonAction = self?.getFooterActionFromButtonAction(action) else { return }

            self?.action?(buttonAction)
        }
    }

    private func getFooterActionFromButtonAction(_ buttonAction: ButtonAction) -> BottomSheetFooterViewAction? {
        guard case let .tap(model) = buttonAction, let model = model else { return nil }

        let title = model.title

        var action: BottomSheetFooterViewAction?
        switch model.style {
        case .primary:
            action = .primaryButtonTap(text: title)
        case .secondary:
            action = .secondaryButtonTap(text: title)
        case .tertiary:
            action = .tertiaryButtonTap(text: title)
        default:
            action = .customButtonTap(model: model)
        }
        return action
    }

    private func getModelForStyle(_ style: ButtonModel.Style, andText text: String) -> ButtonModel {
        .init(
            title: text,
            style: style,
            icon: .without,
            size: .medium,
            accessibility: nil
        )
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? BottomSheetFooterViewModel else {
            return
        }

        switch model.style {
        case let .text(primaryButtonText, secondaryButtonText, tertiaryButtonText):
            firstButton.isHidden = primaryButtonText == nil
            secondButton.isHidden = secondaryButtonText == nil
            thirdButton.isHidden = tertiaryButtonText == nil

            if let primaryText = primaryButtonText {
                configureButton(
                    firstButtonComponent,
                    withModel: getModelForStyle(.primary, andText: primaryText)
                )
            }

            if let secondaryText = secondaryButtonText {
                configureButton(
                    secondButtonComponent,
                    withModel: getModelForStyle(.secondary, andText: secondaryText)
                )
            }

            if let tertiaryText = tertiaryButtonText {
                configureButton(
                    thirdButtonComponent,
                    withModel: getModelForStyle(.tertiary, andText: tertiaryText)
                )
            }

        case let .model(firstButtonModel, secondButtonModel, thirdButtonModel):
            firstButton.isHidden = firstButtonModel == nil
            secondButton.isHidden = secondButtonModel == nil
            thirdButton.isHidden = thirdButtonModel == nil

            configureButton(firstButtonComponent, withModel: firstButtonModel)
            configureButton(secondButtonComponent, withModel: secondButtonModel)
            configureButton(thirdButtonComponent, withModel: thirdButtonModel)
        }
    }

    func bindAction(_ action: ((BottomSheetFooterViewAction) -> Void)?) {
        self.action = action
    }
}
