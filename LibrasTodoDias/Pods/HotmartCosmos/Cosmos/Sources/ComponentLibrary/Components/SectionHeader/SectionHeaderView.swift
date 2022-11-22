//
//  SectionHeaderView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

final class SectionHeaderView: CodedView, Bindable {
    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let textStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = 4
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let buttonStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()

    private let subtitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()

    private lazy var actionButton: UIButton = {
        let view = UIButton()
        view.semanticContentAttribute = .forceRightToLeft
        view.titleEdgeInsets = .init(top: .zero, left: -10, bottom: .zero, right: 10)
        view.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        return view
    }()

    private let spacingView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Private Properties

    private var action: ((SectionHeaderAction) -> Void)?
    private var viewModel: SectionHeaderModel?

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color

        guard let viewModel = viewModel else {
            return
        }

        let system = viewModel.getSystem()
        configureWithSystem(system, disabled: viewModel.disabled)
    }

    // MARK: - CodedView

    override func addSubviews() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(subtitleLabel)

        buttonStackView.addArrangedSubview(spacingView)
        buttonStackView.addArrangedSubview(actionButton)

        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(buttonStackView)

        addSubview(mainStackView)
    }

    override func constrainSubviews() {
        mainStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Private Methods

    private func configureWithSystem(_ system: SystemSectionHeader, disabled: Bool) {
        titleLabel.font = system.titleTypography.font
        titleLabel.textColor = disabled ? system.disabledColor?.color : system.titleColor.color

        subtitleLabel.font = system.subtitleTypography?.font
        subtitleLabel.textColor = disabled ? system.disabledColor?.color : system.subtitleColor?.color

        actionButton.setTitleColor(disabled ? system.disabledColor?.color : system.buttonColor?.color, for: .normal)
        actionButton.tintColor = disabled ? system.disabledColor?.color : system.buttonColor?.color
        actionButton.titleLabel?.font = system.buttonTypography?.font
        actionButton.isHidden = system.buttonColor == nil
        actionButton.isUserInteractionEnabled = !disabled
    }

    @objc
    private func buttonDidTouchUpInside() {
        action?(.viewMore)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? SectionHeaderModel else {
            return
        }

        self.viewModel = model

        let system = model.getSystem()
        configureWithSystem(system, disabled: model.disabled)

        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        subtitleLabel.isHidden = model.subtitle == nil
        actionButton.setTitle(model.buttonTitle, for: .normal)
        actionButton.setImage(Cosmos.iconSet(imageType: model.icon, size: .small), for: .normal)
    }

    func bindAction(_ action: ((SectionHeaderAction) -> Void)?) {
        self.action = action
    }
}
