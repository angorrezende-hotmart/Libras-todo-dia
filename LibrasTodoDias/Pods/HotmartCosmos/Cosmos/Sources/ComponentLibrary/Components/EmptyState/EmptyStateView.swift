//
//  EmptyStateView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 04/11/21.
//

final class EmptyStateView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let roundedViewSize: CGFloat = 200.0
        static let imageSize: CGFloat = 80.0
        static let titleNumberOfLines: Int = 4
        static let descriptionNumberOfLines: Int = .zero
    }

    // MARK: - View Elements

    private let roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.roundedViewSize / 2
        view.clipsToBounds = true
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let illustrationView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let contentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing7.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let textView: UIView = {
        let view = UIView()
        return view
    }()

    private let buttonsStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing3.value
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = Constants.titleNumberOfLines
        view.textAlignment = .center
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = Constants.descriptionNumberOfLines
        view.textAlignment = .center
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }()

    private let firstButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private let secondButtonComponent: Component<ButtonModel, ButtonAction> = Cosmos.makeButton()

    private lazy var firstButtonView: UIView = {
        let view = firstButtonComponent.view()
        return view
    }()

    private lazy var secondButtonView: UIView = {
        let view = secondButtonComponent.view()
        return view
    }()

    // MARK: - Properties

    private var system: SystemEmptyState?
    private var action: ((EmptyStateAction) -> Void)?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(roundedView)
        roundedView.addSubview(imageView)

        addSubview(illustrationView)
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(textView)
        textView.addSubview(titleLabel)
        textView.addSubview(descriptionLabel)

        contentStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(firstButtonView)
        buttonsStackView.addArrangedSubview(secondButtonView)
    }

    override func constrainSubviews() {
        constrainRoundedView()
        constrainIllustrationView()
        constrainContentStackView()
        constrainTitleLabel()
        constrainDescriptionLabel()
    }

    private func constrainRoundedView() {
        roundedView.anchorCenterXToSuperview()
        roundedView.anchor(
            top: topAnchor,
            widthConstant: Constants.roundedViewSize,
            heightConstant: Constants.roundedViewSize
        )

        imageView.anchorCenterSuperview()
        imageView.anchor(
            widthConstant: Constants.imageSize,
            heightConstant: Constants.imageSize
        )
    }

    private func constrainIllustrationView() {
        illustrationView.anchorCenterXToSuperview()
        illustrationView.anchor(
            top: topAnchor,
            widthConstant: Constants.roundedViewSize,
            heightConstant: Constants.roundedViewSize
        )
    }

    private func constrainTitleLabel() {
        titleLabel.anchor(
            top: textView.topAnchor,
            leading: textView.leadingAnchor,
            trailing: textView.trailingAnchor
        )
    }

    private func constrainDescriptionLabel() {
        descriptionLabel.anchor(
            top: titleLabel.bottomAnchor,
            leading: textView.leadingAnchor,
            bottom: textView.bottomAnchor,
            trailing: textView.trailingAnchor
        )
    }

    private func constrainContentStackView() {
        contentStackView.anchor(
            top: roundedView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing6.value,
            leadingConstant: Spacing().spacing9.value,
            trailingConstant: Spacing().spacing9.value
        )

        contentStackView.layout(using: [
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Spacing().spacing3.value),
        ])
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        invalidateIntrinsicContentSize()
        guard let system = system else {
            return
        }

        roundedView.backgroundColor = system.color.roundedView.color
        imageView.tintColor = system.color.image.color
        titleLabel.textColor = system.color.title.color
        descriptionLabel.textColor = system.color.description.color

        titleLabel.font = system.typography.title.font
        descriptionLabel.font = system.typography.description.font
    }

    // MARK: - Private Methods

    private func configurateButtonsIfNeeded(_ model: EmptyStateModel) {
        buttonsStackView.isHidden = true
        guard case let .actions(firstButtonModel, secondButtonModel) = model.style else { return }
        buttonsStackView.isHidden = false

        configurateButton(
            component: firstButtonComponent,
            view: firstButtonView,
            action: .firstButtonTap,
            model: firstButtonModel
        )

        secondButtonView.isHidden = true
        guard let secondButtonModel = secondButtonModel else { return }
        configurateButton(
            component: secondButtonComponent,
            view: secondButtonView,
            action: .secondButtonTap,
            model: secondButtonModel
        )
    }

    private func configurateButton(
        component: Component<ButtonModel, ButtonAction>,
        view: UIView,
        action: EmptyStateAction,
        model: ButtonModel
    ) {
        view.isHidden = false
        component.update(model)
        component.onEvent? { [weak self] _ in
            self?.action?(action)
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? EmptyStateModel else {
            return
        }

        system = model.style.getSystem()
        titleLabel.text = model.title

        if let illustration = model.illustration {
            illustrationView.image = illustration
            roundedView.isHidden = true
            imageView.isHidden = true
        } else {
            imageView.image = model.image ?? .block
            illustrationView.isHidden = true
        }

        if let description = model.description {
            descriptionLabel.text = description
        }

        configurateButtonsIfNeeded(model)
    }

    func bindAction(_ externalAction: ((EmptyStateAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
