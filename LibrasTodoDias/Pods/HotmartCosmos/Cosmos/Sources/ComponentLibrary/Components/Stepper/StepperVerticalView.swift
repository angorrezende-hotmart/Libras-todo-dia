//
//  StepperVerticalView.swift
//  uWallet
//
//  Created by Douglas Seabra Pedrosa on 22/02/22.
//

final class StepperVerticalView: CodedView, StepperProtocol {
    // MARK: - Constants

    private enum Constants {
        static let progressIndicatorWidth: CGFloat = 24.0
        static let progressBarHeight: CGFloat = 12.0
        static let progressBarCornerRadius: CGFloat = 6
    }

    // MARK: - Properties

    private var viewModel: StepperModel?
    private var action: ((StepperAction) -> Void)?
    private var topContraint: NSLayoutConstraint?

    // MARK: - View Elements

    private let progressIndicator: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let progressLine: UIView = {
        let view = UIView()
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()

    private let buttonContainer: UIView = .init()

    private let button: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private let progressBarContainer: UIView = .init()

    private let progressBar: UIProgressView = {
        let view = UIProgressView()
        view.roundCorners(corners: .allCorners, radius: Constants.progressBarCornerRadius)
        view.trackTintColor = Cosmos.colors.productColors.neutralProductColor.white.color
        view.progressTintColor = Cosmos.colors.productColors.yellowProductColor.color.color
        return view
    }()

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(progressIndicator)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(progressLine)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(buttonContainer)
        stackView.addArrangedSubview(progressBarContainer)
        buttonContainer.addSubview(button.view())
        progressBarContainer.addSubview(progressBar)
    }

    override func constrainSubviews() {
        constrainProgressIndicator()
        constrainTitleLabel()
        constrainProgressLine()
        constrainstackView()
        constrainButton()
        constrainProgressBar()
    }

    // MARK: - Constrain Setup

    private func constrainProgressIndicator() {
        progressIndicator.anchor(
            leading: leadingAnchor,
            widthConstant: Constants.progressIndicatorWidth
        )
        topContraint = progressIndicator.topAnchor.constraint(equalTo: topAnchor)
        topContraint?.isActive = true
    }

    private func constrainProgressLine() {
        progressLine.anchor(
            top: progressIndicator.bottomAnchor,
            bottom: bottomAnchor,
            widthConstant: .one
        )

        progressLine.centerXAnchor.constraint(equalTo: progressIndicator.centerXAnchor).isActive = true
        progressLine.heightAnchor.constraint(greaterThanOrEqualToConstant: Spacing().spacing7.value).isActive = true
    }

    private func constrainTitleLabel() {
        titleLabel.anchor(
            leading: progressIndicator.trailingAnchor,
            trailing: trailingAnchor,
            leadingConstant: Spacing().spacing2.value,
            trailingConstant: Spacing().spacing6.value
        )
        titleLabel.centerYAnchor.constraint(equalTo: progressIndicator.centerYAnchor).isActive = true
    }

    private func constrainstackView() {
        stackView.anchor(
            top: titleLabel.bottomAnchor,
            leading: titleLabel.leadingAnchor,
            bottom: bottomAnchor,
            trailing: titleLabel.trailingAnchor,
            bottomConstant: Spacing().spacing6.value
        )
    }

    private func constrainButton() {
        button.view().anchor(
            top: buttonContainer.topAnchor,
            leading: buttonContainer.leadingAnchor,
            bottom: buttonContainer.bottomAnchor,
            topConstant: Spacing().spacing4.value
        )
    }

    private func constrainProgressBar() {
        progressBar.anchor(
            top: progressBarContainer.topAnchor,
            leading: progressBarContainer.leadingAnchor,
            bottom: progressBarContainer.bottomAnchor,
            trailing: progressBarContainer.trailingAnchor,
            topConstant: Spacing().spacing4.value,
            heightConstant: Constants.progressBarHeight
        )
    }

    // MARK: - Private Methods

    private func configurateView() {
        guard let model = viewModel else {
            return
        }

        var titleColor: SystemColor = Cosmos.colors.productColors.neutralProductColor.neutral500
        var titleFont: UIFont = Cosmos.typography.body.text3.font
        var subtitleColor: SystemColor = Cosmos.colors.productColors.neutralProductColor.neutral500

        switch model.status {
        case .done:
            progressIndicator.image = .stepperDone
            progressIndicator.tintColor = model.color()
            progressLine.backgroundColor = model.color()
        case .current:
            titleColor = Cosmos.colors.productColors.neutralProductColor.neutral900
            titleFont = Cosmos.typography.bodyStrong.text2Strong.font
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral700
            progressIndicator.image = .stepperCurrent
            progressIndicator.tintColor = model.color()
            progressLine.backgroundColor = model.color()
        case .next:
            titleColor = Cosmos.colors.productColors.neutralProductColor.neutral400
            titleFont = Cosmos.typography.body.text3.font
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral400
            progressIndicator.image = .stepperNext
            progressIndicator.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral400.color
            progressLine.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
        }

        topContraint?.constant = model.position == .first ? Spacing().spacing2.value : .zero
        progressLine.isHidden = model.position == .last ? true : false

        titleLabel.text = model.title
        titleLabel.textColor = titleColor.color
        titleLabel.font = titleFont
        subtitleLabel.renderAsHTML(model.subtitle ?? .empty, with: Cosmos.typography.body.text1.font, color: subtitleColor)

        if case let .vertical(dataType) = model.style {
            resolveDataType(dataType)
        }
    }

    private func resolveDataType(_ dataType: StepperModel.HorizontalDataType) {
        switch dataType {
        case let .button(title):
            bindButton(title)
            progressBarContainer.isHidden = true
            progressBar.isHidden = true
        case let .progressBar(progress):
            bindProgressBar(progress)
            buttonContainer.isHidden = true
            button.view().isHidden = true
        case .default:
            buttonContainer.isHidden = true
            button.view().isHidden = true
            progressBarContainer.isHidden = true
            progressBar.isHidden = true
        }
    }

    private func bindButton(_ title: String) {
        buttonContainer.isHidden = false
        button.view().isHidden = false

        button.update(.init(title: title, style: .secondary, icon: .without, size: .small, accessibility: nil))

        button.onEvent? { [weak self] _ in
            self?.action?(.buttonTap)
        }
    }

    private func bindProgressBar(_ progress: Float) {
        progressBarContainer.isHidden = false
        progressBar.isHidden = false
        progressBar.progress = progress
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? StepperModel else {
            return
        }
        self.viewModel = model

        configurateView()
    }

    func bindAction(_ externalAction: ((StepperAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
