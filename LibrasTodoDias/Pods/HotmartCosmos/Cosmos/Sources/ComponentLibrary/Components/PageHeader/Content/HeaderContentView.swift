//
//  HeaderContentView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import Foundation

final class HeaderContentView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
        }

        return stackView.build()
    }()

    private let avatarComponent: Component<AvatarModel, AvatarAction> = Cosmos.makeAvatar()

    private lazy var avatarView: UIView = {
        let view = avatarComponent.view()
        return view
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = .zero
        return view
    }()

    private let descriptionLabel: Component<TruncatedLabelModel, TruncatedLabelAction> = Cosmos.makeTruncatedLabel()

    private let tagsStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .fill
            $0.alignment = .center
        }.build()

        return stackView
    }()

    private let firstTagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    private let secondTagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    private let thirdTagComponent: Component<TagModel, Void> = Cosmos.makeTag()

    private lazy var firstTagView: UIView = {
        let view = firstTagComponent.view()
        return view
    }()

    private lazy var secondTagView: UIView = {
        let view = secondTagComponent.view()
        return view
    }()

    private lazy var thirdTagView: UIView = {
        let view = thirdTagComponent.view()
        return view
    }()

    // MARK: - Private Properties

    private var system: SystemHeaderContent?
    private var action: ((HeaderContentActions) -> Void)?

    // MARK: - Constraints

    private lazy var mainStackViewTopConstraint: NSLayoutConstraint = {
        let constraint = mainStackView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: .zero)
        return constraint
    }()

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(avatarView)
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(tagsStackView)
        mainStackView.addArrangedSubview(descriptionLabel.view())

        tagsStackView.addArrangedSubview(firstTagView)
        tagsStackView.addArrangedSubview(secondTagView)
        tagsStackView.addArrangedSubview(thirdTagView)
    }

    override func constrainSubviews() {
        constrainAvatarView()
        constrainMainStackView()
    }

    private func constrainAvatarView() {
        avatarView.anchor(
            top: topAnchor
        )

        avatarView.anchorCenterXToSuperview()
    }

    private func constrainMainStackView() {
        mainStackView.anchor(
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing6.value
        )

        mainStackView.layout(using: [
            mainStackViewTopConstraint,
        ])
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system else {
            return
        }

        titleLabel.font = system.typography.title.font
        titleLabel.textColor = system.colors.title.color
    }

    // MARK: - Private Methods

    private func configurateTagsIfNeeded(_ model: HeaderContentModel) {
        tagsStackView.isHidden = true
        if case let .tags(firstTag, secondTag, thirdTag) = model.style {
            tagsStackView.isHidden = false

            firstTagComponent.update(firstTag)

            secondTagView.isHidden = true
            if let secondTag = secondTag {
                secondTagView.isHidden = false
                secondTagComponent.update(secondTag)
            }

            thirdTagView.isHidden = true
            if let thirdTag = thirdTag {
                thirdTagView.isHidden = false
                thirdTagComponent.update(thirdTag)
            }
        }
    }

    private func configurateSpacing(with system: SystemHeaderContent) {
        mainStackView.spacing = system.spacing.betweenTitleAndDescription
        mainStackViewTopConstraint.constant = system.spacing.betweenAvatarAndTitle
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? HeaderContentModel else {
            return
        }

        let system = model.getSystem()
        self.system = system

        avatarComponent.update(model.avatar)
        titleLabel.text = model.title

        configurateTagsIfNeeded(model)
        configurateSpacing(with: system)
        configurateColors()

        descriptionLabel.update(
            TruncatedLabelModel(
                text: model.description.text,
                textTypography: system.typography.description,
                textColor: { system.colors.description },
                expandLabelText: model.description.expandLabelText,
                expandLabelTypography: Cosmos.typography.bodyStrong.text2Strong,
                numberOfLinesWhenCollapsed: model.description.numberOfLinesWhenCollapsed,
                style: model.description.style,
                textAligment: model.description.textAligment
            )
        )

        descriptionLabel.onEvent? { _ in
            self.action?(.onTapDescription)
        }

        avatarComponent.onEvent? { _ in
            self.action?(.onTapAvatar)
        }
    }

    func bindAction(_ action: ((HeaderContentActions) -> Void)?) {
        self.action = action
    }
}
