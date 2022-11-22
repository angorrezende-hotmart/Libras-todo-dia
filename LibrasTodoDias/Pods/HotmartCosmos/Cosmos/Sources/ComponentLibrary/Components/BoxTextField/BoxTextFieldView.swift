//
//  BoxTextFieldView.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 10/12/21.
//

import Foundation
import UIKit

final class BoxTextFieldView: ThemedCodedView, Bindable {
    // MARK: - View Metrics

    private enum Constants {
        static let textFiedlBorderWidth: CGFloat = 1.0
        static let textFielHeight: CGFloat = 48.0
        static let textFieldWidth: CGFloat = 48.0
        static let minBoxItems: Int = 1
        static let maxBoxItems: Int = 6
        static let dashPattern: [NSNumber] = [10, 4]
    }

    // MARK: - View Elements

    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = Spacing().spacing2.value
        return stackView
    }()

    private let descriptionStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .fill

        }.build()

        stackView.setContentHuggingPriority(.required, for: .vertical)
        return stackView
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.isHidden = true
        view.numberOfLines = .zero
        view.textAlignment = .center
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()

    // MARK: - Private Properties

    private var viewModel: BoxTextFieldModel?
    private var action: ((BoxTextFieldAction) -> Void)?
    private var textFields: [UITextField] {
        textFieldStackView.subviews.compactMap({ $0 as? UITextField })
    }

    private var value: String {
        textFields
            .compactMap(\.text)
            .reduce("", { $0 + $1 })
    }

    private var numberOfItems: Int = .zero

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = viewModel?.getSystem() else { return }
        descriptionLabel.font = system.descriptionTypography.font
        configureTextForSystem(system)
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(textFieldStackView)
        addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(descriptionLabel)
    }

    override func constrainSubviews() {
        constrainTextFieldStackView()
        constrainDescriptionStackView()
    }

    private func constrainTextFieldStackView() {
        textFieldStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )
    }

    private func constrainDescriptionStackView() {
        descriptionStackView.anchor(
            top: textFieldStackView.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing1.value
        )
    }

    private func constrainTextFields() {
        textFields.forEach {
            $0.widthAnchor.constraint(equalToConstant: Constants.textFieldWidth).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Constants.textFielHeight).isActive = true
        }
    }

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        textFields.first?.becomeFirstResponder() ?? false
    }

    // MARK: - Private Methods

    private func configureForState() {
        guard let state = viewModel?.state else {
            return
        }

        let styleColor = state.getBorderColor()
        let styleBackgroundColor = state.getBackgroundColor()
        descriptionLabel.textColor = styleColor
        textFields.forEach {
            $0.textColor = state.getTextColor()
            if case .disabled = state {
                $0.isEnabled = false
                $0.isUserInteractionEnabled = false
                $0.layer.borderColor = UIColor.clear.cgColor
                configureDashBorder(textField: $0, strokeColor: styleColor, fillColor: styleBackgroundColor)
            } else {
                clearDashBorder(textField: $0)
                $0.isEnabled = true
                $0.isUserInteractionEnabled = true
                $0.layer.borderColor = styleColor.cgColor
            }
        }
    }

    private func configureTextForSystem(_ system: SystemBoxTextField) {
        textFields.forEach {
            $0.font = system.textTypography.font
        }
    }

    private func makeTextField(_ index: Int) -> CustomDeleteActionTextField {
        let textField = CustomDeleteActionTextField()
        textField.font = Cosmos.typography.bodyStrong.text2Strong.font
        textField.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        textField.contentMode = .center
        textField.textAlignment = .center
        textField.layer.borderWidth = Constants.textFiedlBorderWidth
        textField.layer.cornerRadius = BorderRadiusGroup().small.value
        textField.delegate = self
        textField.deleteDelegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        return textField
    }

    @objc func textFieldDidChange(textField: UITextField) {
        guard let text = textField.text else { return }
        action?(.textDidChange(value))
        if text.count > .one {
            textField.text = "\(text[text.index(before: text.endIndex)])"
        }

        guard
            let textCount = textField.text?.utf16.count,
            textCount >= .one
        else { return }

        guard
            let indexOfTextField = textFields.firstIndex(of: textField),
            textFields.indices.contains(indexOfTextField + .one)
        else {
            endEditing(true)
            action?(.textFinishEdit(value))
            return
        }

        let nextTextField = textFields[indexOfTextField + .one]
        nextTextField.becomeFirstResponder()
    }

    private func selectTextField(_ textField: UITextField, isSelected: Bool) {
        guard let system = viewModel?.getSystem() else {
            return
        }
        if isSelected {
            textField.backgroundColor = system.activeBackgroundColor.color
            textField.layer.borderColor = system.activeColor.color.cgColor
        } else {
            textField.backgroundColor = textField.text?.isEmpty == false ? system.activeBackgroundColor.color : system.defaultBackgroundColor.color
            textField.layer.borderColor = system.defaultColor.color.cgColor
        }
    }

    private func setupBeginEditing() {
        guard let system = viewModel?.getSystem() else {
            return
        }
        textFields.forEach {
            $0.layer.borderColor = system.defaultColor.color.cgColor
            $0.backgroundColor = $0.text?.isEmpty == false ? system.activeBackgroundColor.color : system.defaultBackgroundColor.color
            $0.textColor = system.textColor.color
        }
        descriptionLabel.isHidden = true
    }

    private func removeAllTextFields() {
        textFieldStackView.removeSubviews()
    }

    private func clearDashBorder(textField: UITextField) {
        guard let border = textField.layer.sublayers?.first(where: { $0 is CAShapeLayer }), let dashBorder = border as? CAShapeLayer else {
            return
        }

        dashBorder.fillColor = UIColor.clear.cgColor
        dashBorder.strokeColor = UIColor.clear.cgColor
    }

    private func configureDashBorder(textField: UITextField, strokeColor: UIColor, fillColor: UIColor) {
        guard let border = textField.layer.sublayers?.first(where: { $0 is CAShapeLayer }), let dashBorder = border as? CAShapeLayer else {
            textField.addDashedBorder(
                strokeColor: strokeColor,
                fillColor: fillColor,
                cornerRadius: BorderRadiusGroup().small.value,
                customWidth: Constants.textFieldWidth,
                customHeight: Constants.textFielHeight
            )
            return
        }
        dashBorder.fillColor = fillColor.cgColor
        dashBorder.strokeColor = strokeColor.cgColor
    }

    private func createTextFields() {
        guard textFieldStackView.subviews.count != numberOfItems else {
            return
        }
        removeAllTextFields()
        for tag in Constants.minBoxItems ... numberOfItems {
            let textField = makeTextField(tag)
            textField.tag = tag
            textFieldStackView.addArrangedSubview(textField)
        }
        constrainTextFields()
    }

    public func setValue(_ value: String) {
        if value.isEmpty {
            textFields.forEach { textField in
                textField.text = .empty
            }
        }

        value.enumerated().forEach { item in
            let index = item.offset
            guard textFields.indices.contains(index) else { return }
            textFields[index].text = String(item.element)
        }

        if value.count == numberOfItems {
            action?(.textFinishEdit(value))
        }
    }

    // MARK: - Bind Model

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? BoxTextFieldModel else { return }

        self.viewModel = model

        numberOfItems = model.numberOfItems > Constants.maxBoxItems ? Constants.maxBoxItems : model.numberOfItems

        createTextFields()
        configureForState()

        if let description = model.description {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }

        if let value = model.value {
            setValue(value)
        }

        textFields.forEach {
            $0.isSecureTextEntry = model.isSecureTextEntry
            $0.keyboardType = model.keyboardType
        }
    }

    func bindAction(_ externalAction: ((BoxTextFieldAction) -> Void)?) {
        action = { textFieldAction in
            externalAction?(textFieldAction)
        }
    }
}

extension BoxTextFieldView: UITextFieldDelegate, CustomDeleteActionTextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        setupBeginEditing()
        selectTextField(textField, isSelected: true)
        action?(.textFieldDidBeginEditing)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        selectTextField(textField, isSelected: false)
    }

    public func textFieldDidSelectDeleteButton(_ textField: UITextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }
        if index - .one >= .zero {
            textField.text = .empty
            textFields[index - .one].becomeFirstResponder()
            textFields[index - .one].text = .empty
        } else {
            textField.resignFirstResponder()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        action?(.textFieldReturnPressed(textField))
        return true
    }
}

public protocol CustomDeleteActionTextFieldDelegate: AnyObject {
    func textFieldDidSelectDeleteButton(_ textField: UITextField)
}

final class CustomDeleteActionTextField: UITextField {
    public weak var deleteDelegate: CustomDeleteActionTextFieldDelegate?

    override public func deleteBackward() {
        deleteDelegate?.textFieldDidSelectDeleteButton(self)
        super.deleteBackward()
    }

    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
