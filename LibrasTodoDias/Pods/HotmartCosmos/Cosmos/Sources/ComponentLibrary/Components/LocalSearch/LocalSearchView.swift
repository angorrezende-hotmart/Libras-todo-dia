//
//  LocalSearchView.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 07/01/22.
//

import Foundation

final class LocalSearchView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let viewHeight: CGFloat = 40.0
        static let iconButtonSize: CGFloat = 36.0
    }

    // MARK: - Properties

    private var viewModel: AppTopBarModel?
    private var action: ((LocalSearchAction) -> Void)?

    // MARK: - View Elements

    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill

        }.build()

        return stackView
    }()

    private let searchImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.image = UIImage(asset: Asset.searchMd)
        return view
    }()

    private lazy var clearImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.image = UIImage(asset: Asset.clearMd)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.clearGestureDidRecognize(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var searchTextField: UITextField = {
        let view = UITextField()
        view.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.leftView = searchImageView
        view.leftViewMode = .always
        view.rightView = clearImageView
        view.rightViewMode = .whileEditing
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.delegate = self

        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        searchImageView.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        searchTextField.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral100.color
        searchTextField.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        searchTextField.font = Cosmos.typography.bodyStrong.text1Strong.font
    }

    // MARK: - Override

    override func becomeFirstResponder() -> Bool {
        searchTextField.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        searchTextField.resignFirstResponder()
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(searchTextField)
    }

    override func constrainSubviews() {
        constrainSearchImageView()
        constrainClearImageView()
        constraintStackView()
    }

    private func constrainSearchImageView() {
        searchImageView.anchor(
            widthConstant: Constants.iconButtonSize
        )
    }

    private func constrainClearImageView() {
        clearImageView.anchor(
            widthConstant: Constants.iconButtonSize
        )
    }

    private func constraintStackView() {
        stackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing1.value,
            leadingConstant: Spacing().spacing2.value,
            bottomConstant: Spacing().spacing1.value,
            trailingConstant: Spacing().spacing2.value,
            heightConstant: Constants.viewHeight
        )
    }

    // MARK: - Private Methods

    private func configurePlaceholderWithText(_ text: String) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .font: Cosmos.typography.body.text1.font,
                .foregroundColor: Cosmos.colors.productColors.neutralProductColor.neutral500.color,
            ]
        )

        searchTextField.attributedPlaceholder = attributedString
    }

    private func configureKeyboardType(for keyboardType: UIKeyboardType) {
        searchTextField.inputAccessoryView = getToolbarForKeyboard()
        searchTextField.keyboardType = keyboardType
    }

    private func getToolbarForKeyboard() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.items = [
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            .init(title: "OK", style: .done, target: self, action: #selector(doneButtonTapped)),
        ]
        toolbar.sizeToFit()
        return toolbar
    }

    @objc private func doneButtonTapped() {
        searchTextField.resignFirstResponder()
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        action?(.searchTextDidChange(string: textField.text))
    }

    @objc
    private func clearGestureDidRecognize(_ sender: UITapGestureRecognizer?) {
        searchTextField.text = .empty
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? LocalSearchModel else {
            return
        }

        configurePlaceholderWithText(model.placeholder)
        if let keyboardType = model.keyboardType {
            configureKeyboardType(for: keyboardType)
        } else {
            configureKeyboardType(for: .default)
        }
    }

    func bindAction(_ externalAction: ((LocalSearchAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}

// MARK: - UITextFieldDelegate

extension LocalSearchView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        action?(.textFieldDidEndEditing(textField: textField))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
