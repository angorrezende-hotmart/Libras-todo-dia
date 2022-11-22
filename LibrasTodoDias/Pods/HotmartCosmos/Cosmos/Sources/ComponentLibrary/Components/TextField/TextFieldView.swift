//
//  TextFieldView.swift
//  HotmartCosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 02/07/21.
//

import UIKit

final class TextFieldView: ThemedCodedView, Bindable {
    // MARK: - View Metrics

    private enum Constants {
        static let textViewBorderWidth: CGFloat = 1.0
        static let textViewBottomEdge: CGFloat = 10.0
        static let textViewTopSpacing: CGFloat = -10.0
        static let placeholderTopSpacing: CGFloat = -10.0
        static let placeholderHeight: CGFloat = 44.0
        static let dropdownTrailingSpacing: CGFloat = 18.0
        static let dropdownBottomEdge: CGFloat = 10.0
        static let textViewMinHeight: CGFloat = 38.0
        static let textViewMaxHeight: CGFloat = 126.0
        static let labelViewHeight: CGFloat = 16.0
        static let buttonWidth: CGFloat = 54.0
        static let trailingLoadingSpacing: CGFloat = 14.5
        static let dashPattern: [NSNumber] = [10, 4]
    }

    // MARK: - Cosmos Models

    private var bottomSheetModel: BottomSheetModel = {
        let model = BottomSheetModel(
            header: .none,
            style: .list(models: .init(listModels: [])),
            footer: .none,
            hideIndicator: true
        )
        return model
    }()

    // MARK: - View Elements

    private let label: UILabel = {
        let view = UILabel()
        return view
    }()

    private let labelView: UIView = {
        let view = UIView()
        view.alpha = .zero
        return view
    }()

    private let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = BorderRadiusGroup().small.value
        view.layer.borderWidth = Constants.textViewBorderWidth
        return view
    }()

    private let textFieldStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing1.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private lazy var prefixStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
        }.build()

        stackView.addArrangedSubview(prefixLabel)
        stackView.addSpacingViewOfWidth(Spacing().spacing1.value)
        stackView.isHidden = true

        return stackView
    }()

    private let prefixLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.bodyStrong.text2Strong.font
        view.textColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        return view
    }()

    private lazy var textView: UITextView = {
        let view = UITextView()
        view.delegate = self
        view.isHidden = true
        view.backgroundColor = .clear
        return view
    }()

    private lazy var textField: UITextField = {
        let view = UITextField()
        view.delegate = self
        view.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
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
        view.numberOfLines = 0
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()

    private let characterLimitLabel: UILabel = {
        let view = UILabel()
        view.isHidden = true
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    private lazy var dropdownButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(dropdownButtonDidTouchUpInside), for: .touchUpInside)
        view.isHidden = true
        return view
    }()

    private let dropdownImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.image = Cosmos.iconSet(imageType: .expandMore, size: .medium)
        view.isHidden = true
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    private lazy var secureButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(secureButtonDidTouchUpInside), for: .touchUpInside)
        view.isHidden = true
        return view
    }()

    private let secureImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.image = Cosmos.iconSet(imageType: .visibilityOff, size: .medium)
        view.isHidden = true
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        if #available(iOS 12.0, *) {
            view.color = traitCollection.userInterfaceStyle == .dark ? .white : .darkGray
        }
        view.isHidden = true
        return view
    }()

    private lazy var datePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        return datePicker
    }()

    private let placeholderLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private lazy var rightIconButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.addTarget(self, action: #selector(rightButtonDidTouchUpInside), for: .touchUpInside)
        return button
    }()

    private lazy var rightIconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.isHidden = true
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    // MARK: - Private Properties

    private var viewModel: TextFieldModel?
    private var action: ((TextFieldAction) -> Void)?
    private var dropdownOptions: [String]?
    private var numberOfCharacters: Int = 0

    private lazy var textViewHeightConstraint: NSLayoutConstraint = {
        let constraint = textView.heightAnchor.constraint(equalToConstant: Constants.textViewMinHeight)
        return constraint
    }()

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = viewModel?.getSystem() else { return }
        labelView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        borderView.layer.borderColor = Cosmos.colors.productColors.neutralProductColor.black.color.cgColor

        label.font = system.labelTypography.font
        placeholderLabel.font = system.placeholderTypography.font
        placeholderLabel.textColor = system.placeholderColor.color

        configureForState()
        configureTextForSystem(system)
        descriptionLabel.font = system.descriptionTypography.font
        characterLimitLabel.font = system.descriptionTypography.font
        secureImageView.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        rightIconImageView.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(borderView)
        borderView.addSubview(textView)
        borderView.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(textField)
        textFieldStackView.addArrangedSubview(dropdownImageView)
        addSubview(labelView)
        labelView.addSubview(label)
        addSubview(placeholderLabel)
        addSubview(dropdownButton)
        addSubview(loadingIndicator)
        addSubview(descriptionStackView)
        addSubview(secureButton)
        secureButton.addSubview(secureImageView)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addSpacingView()
        descriptionStackView.addArrangedSubview(characterLimitLabel)
        addSubview(rightIconButton)
        rightIconButton.addSubview(rightIconImageView)
    }

    override func constrainSubviews() {
        constrainLabel()
        constrainLabelView()
        constrainBorderView()
        constrainTextView()
        constrainTextFieldStackView()
        constrainDescriptionStackView()
        constrainDropdownButton()
        constrainLoadingIndicator()
        constrainSecureButton()
        constrainSecureImageView()
        constrainPlaceholderLabel()
        constrainRightIconButton()
        constrainRightIconImageView()
    }

    // MARK: - Constrain Methods

    private func constrainLabelView() {
        labelView.anchor(
            top: topAnchor,
            leading: borderView.leadingAnchor,
            leadingConstant: Spacing().spacing3.value,
            heightConstant: Constants.labelViewHeight
        )
    }

    private func constrainLabel() {
        label.anchor(
            top: labelView.topAnchor,
            leading: labelView.leadingAnchor,
            bottom: labelView.bottomAnchor,
            trailing: labelView.trailingAnchor,
            leadingConstant: Spacing().spacing1.value,
            trailingConstant: Spacing().spacing1.value
        )
    }

    private func constrainBorderView() {
        borderView.anchor(
            top: labelView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: Constants.textViewTopSpacing
        )
    }

    private func constrainTextView() {
        textView.anchor(
            top: borderView.topAnchor,
            leading: borderView.leadingAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            topConstant: Spacing().spacing1.value,
            leadingConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )

        textView.layout(using: [
            textViewHeightConstraint,
        ])
    }

    private func constrainTextFieldStackView() {
        textFieldStackView.anchor(
            top: borderView.topAnchor,
            leading: borderView.leadingAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            topConstant: Spacing().spacing1.value,
            leadingConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )
    }

    private func constrainPlaceholderLabel() {
        placeholderLabel.anchor(
            top: labelView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: Constants.placeholderTopSpacing,
            leadingConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value,
            heightConstant: Constants.placeholderHeight
        )
    }

    private func constrainDescriptionStackView() {
        descriptionStackView.anchor(
            top: borderView.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing1.value,
            leadingConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )
    }

    private func constrainDropdownButton() {
        dropdownButton.anchor(
            top: borderView.topAnchor,
            leading: borderView.leadingAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            trailingConstant: Constants.dropdownTrailingSpacing
        )
    }

    private func constrainLoadingIndicator() {
        loadingIndicator.anchor(
            top: borderView.topAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            trailingConstant: Constants.trailingLoadingSpacing
        )
    }

    private func constrainSecureButton() {
        secureButton.anchor(
            top: borderView.topAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            widthConstant: Constants.buttonWidth
        )
    }

    private func constrainSecureImageView() {
        secureImageView.anchorCenterSuperview()
    }

    private func constrainRightIconButton() {
        rightIconButton.anchor(
            top: borderView.topAnchor,
            bottom: borderView.bottomAnchor,
            trailing: borderView.trailingAnchor,
            widthConstant: Constants.buttonWidth
        )
    }

    private func constrainRightIconImageView() {
        rightIconImageView.anchorCenterSuperview()
    }

    // MARK: - Actions

    @objc private func rightButtonDidTouchUpInside(_ sender: UIButton) {
        action?(.didTapRightIcon)
    }

    @objc private func dropdownButtonDidTouchUpInside(_ sender: UIButton) {
        UIView.animation(withDuration: .recFast) { [weak self] in
            self?.dropdownImageView.transform = CGAffineTransform(rotationAngle: .pi)
            self?.configureBottomSheetAndPresent()
        }
    }

    @objc private func secureButtonDidTouchUpInside(_ sender: UIButton) {
        let isSecure = !textField.isSecureTextEntry
        configureSecureState(isSecure)

        action?(.didToggleSecure(isSecure))
    }

    @objc private func doneButtonTapped() {
        textView.resignFirstResponder()
        textField.resignFirstResponder()
    }

    @objc private func textFieldDidChange(textField: UITextField) {
        guard var text = textField.text else { return }
        switch viewModel?.style {
        case let .currency(_, locale):
            text = text.currencyInputFormatting(locale: locale)
            textField.text = text
        default:
            break
        }

        if let characterSet = viewModel?.characterSet {
            text = text.components(separatedBy: characterSet.inverted).joined()
        }

        if let mask = viewModel?.textMask {
            text = mask.formateValue(text)
        }

        textField.text = text

        updateNumberOfCharacters()
        action?(.textDidChange(text))
    }

    @objc private func doneDatePicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        textField.text = dateFormatter.string(from: datePicker.date)
        textField.resignFirstResponder()

        action?(.textDidChange(textField.text ?? ""))
    }

    @objc private func cancelDatePicker() {
        textField.resignFirstResponder()
    }

    // MARK: - Private Methods

    private func configureForState() {
        guard let viewModel = viewModel else {
            return
        }

        let styleColor = viewModel.state.getColor()
        let backgroundColor = viewModel.state.getBackgroundColor()

        label.textColor = styleColor
        borderView.layer.borderColor = styleColor.cgColor
        dropdownImageView.tintColor = styleColor
        descriptionLabel.textColor = styleColor
        characterLimitLabel.textColor = styleColor
        labelView.isHidden = viewModel.state == .default

        switch viewModel.state {
        case .disabledEmpty, .disabledFilled:
            configureForDisable(styleColor: styleColor, backgroundColor: backgroundColor)
        default:
            configureForUserInteraction(styleColor: styleColor)
        }
    }

    private func configureForDisable(styleColor: UIColor, backgroundColor: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.borderView.backgroundColor = backgroundColor
            self.disableInteracion()
            self.borderView.layer.borderColor = Cosmos.colors.productColors.neutralProductColor.clear.color.cgColor
            self.borderView.addDashedBorder(
                strokeColor: styleColor,
                fillColor: .clear,
                cornerRadius: BorderRadiusGroup().small.value
            )
        }
    }

    private func configureForUserInteraction(styleColor: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.enableInteracion()
            self.borderView.layer.borderColor = styleColor.cgColor
            self.borderView.backgroundColor = .clear
            self.borderView.clearDashedBorder()
        }
    }

    private func disableInteracion() {
        textField.isEnabled = false
        textField.isUserInteractionEnabled = false
        textView.isUserInteractionEnabled = false
    }

    private func enableInteracion() {
        textField.isEnabled = true
        textField.isUserInteractionEnabled = true
        textView.isUserInteractionEnabled = true
    }

    private func animateTextEditing() {
        UIView.animation(withDuration: .veryFast) { [weak self] in
            self?.placeholderLabel.alpha = .zero
            self?.labelView.alpha = .one
        }
    }

    private func animateTextErased() {
        UIView.animation(withDuration: .veryFast) { [weak self] in
            self?.placeholderLabel.alpha = .one
            self?.labelView.alpha = .zero
        }
    }

    private func configureBottomSheetAndPresent() {
        let bottomSheetComponent = Cosmos.makeBottomSheet()

        if let currentOptions = bottomSheetModel.optionsModel?.listModels, currentOptions.isEmpty {
            bottomSheetModel.optionsModel?.listModels = dropdownOptions?.compactMap {
                ListModel(title: $0, style: .default(.simple))
            } ?? []
        }

        bottomSheetComponent.update(bottomSheetModel)
        bottomSheetComponent.onEvent? { [weak self] bottomSheetAction in
            switch bottomSheetAction {
            case let .selected(index):
                guard let index = index else {
                    return
                }

                self?.bottomShetDidSelectAt(index)
            default:
                break
            }
        }

        if let viewController = bottomSheetComponent.viewController?() {
            action?(.didTapDropdownButton(viewController))
        }
    }

    private func bottomShetDidSelectAt(_ index: Int) {
        let title = bottomSheetModel.optionsModel?.listModels[index].title

        textField.text = title
        placeholderLabel.text = nil
        label.text = viewModel?.label
        dropdownImageView.transform = CGAffineTransform(rotationAngle: .zero)

        viewModel?.state = .filled
        animateTextEditing()
        configureForState()

        action?(.dropdownDidSelectAt(index))
    }

    private func configureTextBeginEditing() {
        prefixStackView.isHidden = false
        viewModel?.state = .active
        animateTextEditing()
        configureForState()
    }

    private func configureTextEndEditing(_ text: String?) {
        if text?.isEmpty == true {
            animateTextErased()
            viewModel?.state = .default
            textField.leftView?.isHidden = true
        } else {
            viewModel?.state = .filled
        }
        configureForState()
    }

    private func configureTextForSystem(_ system: SystemTextField) {
        textView.font = system.textTypography.font
        textView.textColor = system.textColor.color
        textField.font = system.textTypography.font
        textField.textColor = system.textColor.color
    }

    private func configureKeyboardType(for style: TextFieldModel.Style, with autocapitalizationType: UITextAutocapitalizationType) {
        switch style {
        case let .custom(type):
            configureKeyboardType(for: type, with: autocapitalizationType)
        case .currency:
            configureKeyboardType(for: .numberPad)
        case let .datePicker(cancelLabel, readyLabel):
            let toolbar = getToolbarForDatePicker(cancelLabel: cancelLabel, readyLabel: readyLabel)
            textField.inputAccessoryView = toolbar
            textField.inputView = datePicker
        default:
            configureKeyboardType(for: .default, with: autocapitalizationType)
        }
    }

    private func configureKeyboardType(for keyboardType: UIKeyboardType, with autocapitalizationType: UITextAutocapitalizationType = .sentences) {
        textField.autocapitalizationType = autocapitalizationType
        textView.autocapitalizationType = autocapitalizationType
        textView.inputAccessoryView = getToolbarForKeyboard()
        textView.keyboardType = keyboardType
        textField.inputAccessoryView = getToolbarForKeyboard()
        textField.keyboardType = keyboardType
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

    private func configureDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        return dateFormatter
    }

    private func getToolbarForDatePicker(cancelLabel: String, readyLabel: String) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: readyLabel, style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker))
        doneButton.tintColor = Cosmos.colors.primaryBrandColor.color.color
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: cancelLabel, style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        return toolbar
    }

    private func updateHeight() {
        guard viewModel?.style == .expansible,
              textView.contentSize.height != textViewHeightConstraint.constant,
              textView.contentSize.height >= Constants.textViewMinHeight else {
            return
        }

        if textView.contentSize.height > Constants.textViewMaxHeight {
            textViewHeightConstraint.constant = Constants.textViewMaxHeight
        } else {
            textViewHeightConstraint.constant = textView.contentSize.height
        }

        action?(.textFieldShouldUpdateHeight)
    }

    private func resetTextViewHeight() {
        textViewHeightConstraint.constant = Constants.textViewMinHeight
    }

    private func updateNumberOfCharacters() {
        numberOfCharacters = viewModel?.style == .expansible ? textView.text.count : textField.text?.count ?? .zero
        if let characterLimit = viewModel?.characterLimit {
            characterLimitLabel.text = "\(numberOfCharacters)/\(characterLimit)"
        }
    }

    private func hasCharactersReachedTheLimit(_ currentText: String, range: NSRange, replacementText: String) -> Bool {
        guard let stringRange = Range(range, in: currentText),
              let characterLimit = viewModel?.characterLimit else { return true }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: replacementText)
        return updatedText.count <= characterLimit
    }

    private func configureSecureState(_ isSecure: Bool) {
        textField.isSecureTextEntry = isSecure
        secureImageView.image = isSecure ? Cosmos.iconSet(imageType: .visibilityOff, size: .medium) : Cosmos.iconSet(imageType: .visibility, size: .medium)
    }

    private func configureSecureImageVisibility(_ isHidden: Bool) {
        secureButton.isHidden = isHidden
        secureImageView.isHidden = isHidden
    }

    private func toggleLoadingActivity(_ isLoading: Bool) {
        if isLoading {
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
        } else {
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
        }
    }

    private func configureRightIconVisibility(_ isHidden: Bool) {
        rightIconButton.isHidden = isHidden
        rightIconImageView.isHidden = isHidden
    }

    // MARK: - Bind Model

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TextFieldModel else {
            return
        }

        self.viewModel = model

        label.text = model.label
        placeholderLabel.text = model.label

        let isExpansible = model.style == .expansible ? true : false
        textView.isHidden = !isExpansible
        textFieldStackView.isHidden = isExpansible

        if var value = model.value {
            animateTextEditing()

            if let characterSet = model.characterSet {
                value = value.components(separatedBy: characterSet.inverted).joined()
            }

            if let mask = model.textMask {
                value = mask.formateValue(value)
            }

            textView.text = value
            textView.sizeToFit()
            textField.text = value

            if case .disabledFilled = model.state {} else {
                self.viewModel?.state = .filled
            }
        }

        isExpansible ? updateHeight() : resetTextViewHeight()

        if let keyboardType = model.keyboardType {
            configureKeyboardType(for: keyboardType, with: model.autocapitalizationType ?? .sentences)
        } else {
            configureKeyboardType(for: model.style, with: model.autocapitalizationType ?? .sentences)
        }

        if let description = model.description {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
            descriptionLabel.text = nil
        }

        if model.characterLimit != nil {
            characterLimitLabel.isHidden = false
            updateNumberOfCharacters()
        }

        dropdownButton.isHidden = true
        dropdownImageView.isHidden = true
        textField.leftView = nil
        switch model.style {
        case let .dropdown(options, model):
            if let model = model {
                bottomSheetModel = model
            } else {
                dropdownOptions = options
            }
            dropdownOptions = options
            dropdownButton.isHidden = false
            dropdownImageView.isHidden = false
        case let .currency(prefix, _):
            prefixLabel.text = prefix
            textField.leftView = prefixStackView
            textField.leftViewMode = .always
            prefixStackView.isHidden = model.value == nil
        case let .secure(isSecure, isHidden):
            textField.isSecureTextEntry = true
            configureSecureImageVisibility(isHidden)
            configureSecureState(isSecure)
        case let .loading(isLoading):
            toggleLoadingActivity(isLoading)

        default:
            break
        }

        if let rightIcon = model.rightIcon {
            let image = Cosmos.iconSet(imageType: rightIcon, size: .medium)
            rightIconImageView.image = image
            configureRightIconVisibility(false)
        } else {
            rightIconImageView.image = nil
            configureRightIconVisibility(true)
        }

        configureForState()
    }

    func bindAction(_ externalAction: ((TextFieldAction) -> Void)?) {
        action = { textFieldAction in
            externalAction?(textFieldAction)
        }
    }

    // MARK: - Override

    override func layoutSubviews() {
        super.layoutSubviews()
        textView.sizeToFit()
        updateHeight()
        action?(.textFieldShouldUpdateHeight)
    }

    override func becomeFirstResponder() -> Bool {
        switch viewModel?.style {
        case .expansible:
            return textView.becomeFirstResponder()
        case .dropdown:
            return false
        default:
            return textField.becomeFirstResponder()
        }
    }

    override func resignFirstResponder() -> Bool {
        switch viewModel?.style {
        case .expansible:
            return textView.resignFirstResponder()
        case .dropdown:
            return false
        default:
            return textField.resignFirstResponder()
        }
    }
}

// MARK: - UITextViewDelegate

extension TextFieldView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        configureTextBeginEditing()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        configureTextEndEditing(textView.text)
    }

    func textViewDidChange(_ textView: UITextView) {
        action?(.textDidChange(textView.text))

        updateNumberOfCharacters()
        updateHeight()
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        return hasCharactersReachedTheLimit(currentText, range: range, replacementText: text)
    }
}

// MARK: - UITextFieldDelegate

extension TextFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        configureTextBeginEditing()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        configureTextEndEditing(textField.text)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        action?(.textFieldReturnPressed(textField))
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        return hasCharactersReachedTheLimit(currentText, range: range, replacementText: string)
    }
}
