//
//  ListView.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

final class ListView: ThemedCodedView, Bindable {
    // MARK: - Cosmos Components

    private let textualContentComponent: Component<TextualContentModel, Void> = {
        let component = Cosmos.makeTextualContent()
        return component
    }()

    private let leftComponent: Component<ListComponentItemModel, ListComponentItemAction> = {
        let component = Cosmos.makeListComponentItem()
        return component
    }()

    private let rightComponent: Component<ListComponentItemModel, ListComponentItemAction> = {
        let component = Cosmos.makeListComponentItem()
        return component
    }()

    private let dividerComponent: Component<DividerModel, Void> = {
        let component = Cosmos.makeDivider()
        let model = DividerModel(style: .fullBleed, hasVerticalSpacing: false)
        component.update(model)
        return component
    }()

    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
        }.build()

        return stackView
    }()

    private lazy var textualContentComponentView: UIView = {
        let view = textualContentComponent.view()
        return view
    }()

    private lazy var leftComponentView: UIView = {
        let view = leftComponent.view()
        return view
    }()

    private lazy var rightComponentView: UIView = {
        let view = rightComponent.view()
        return view
    }()

    private lazy var dividerView: UIView = {
        let view = dividerComponent.view()
        return view
    }()

    // MARK: - Model

    private var leftComponentModel: ListComponentItemModel? {
        didSet {
            guard let model = leftComponentModel else { return }
            leftComponent.update(model)
            let action: ((ListComponentItemAction) -> Void)? = { [weak self] action in
                if case let .tap(isActive) = action {
                    self?.viewModel?.isActive = isActive
                    self?.action?(.leftActionTap(isActive))
                }
            }
            leftComponent.onEvent?(action)
        }
    }

    private var rightComponentModel: ListComponentItemModel? {
        didSet {
            guard let model = rightComponentModel else { return }
            rightComponent.update(model)
            let action: ((ListComponentItemAction) -> Void)? = { [weak self] action in
                if case let .tap(isActive) = action {
                    self?.viewModel?.isActive = isActive
                    self?.action?(.rightActionTap(isActive))
                }
            }
            rightComponent.onEvent?(action)
        }
    }

    // MARK: - Properties

    private var viewModel: ListModel?
    private var action: ((ListAction) -> Void)?

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)
        addSubview(dividerView)

        mainStackView.addArrangedSubview(leftComponentView)
        mainStackView.addArrangedSubview(textualContentComponentView)
        mainStackView.addArrangedSubview(rightComponentView)
    }

    override func constrainSubviews() {
        mainStackView.layout(using: [
            stackViewTopConstraint,
            stackViewLeadingConstraint,
            stackViewBottomConstraint,
            stackViewTrailingConstraint,
        ])

        dividerView.anchor(
            leading: mainStackView.leadingAnchor,
            bottom: bottomAnchor,
            trailing: mainStackView.trailingAnchor
        )
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = .clear
    }

    // MARK: - Constraints

    private lazy var stackViewTopConstraint: NSLayoutConstraint = mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: .zero)

    private lazy var stackViewLeadingConstraint: NSLayoutConstraint = mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)

    private lazy var stackViewBottomConstraint: NSLayoutConstraint = mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero)

    private lazy var stackViewTrailingConstraint: NSLayoutConstraint = mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero)

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ListModel else {
            return
        }

        self.viewModel = model
        let system = model.getSystemList()

        setupTextualContentComponent(for: model, with: system)
        setupSpacing(for: model, with: system)
        setupDivider(for: model)

        leftComponentView.isHidden = true
        rightComponentView.isHidden = true
        buildListItems()
    }

    func bindAction(_ externalAction: ((ListAction) -> Void)?) {
        action = { action in
            externalAction?(action)
        }
    }

    // MARK: - Private Methods

    private func configureView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapList))
        addGestureRecognizer(tapGesture)
    }

    @objc private func didTapList() {
        guard let model = viewModel else { return }

        let isActive = !model.isActive
        viewModel?.isActive = isActive

        (leftComponentView as? ListComponentItemView)?.handleSelected(isSelected: isActive)
        (rightComponentView as? ListComponentItemView)?.handleSelected(isSelected: isActive)
        action?(.listTap(isActive))
    }

    private func setupTextualContentComponent(for model: ListModel, with system: SystemList) {
        let textStyle: TextualContentModel.Style = (model.description == nil || model.description?.isEmpty == true)
            ? .listDesc1
            : .listDesc2(
                description: model.description,
                descriptionStyle: model.descriptionStyle
            )

        let textualComponentModel = TextualContentModel(
            title: model.title,
            titleStyle: model.titleStyle,
            isVerified: model.isVerified,
            style: textStyle
        )

        textualContentComponent.update(textualComponentModel)
    }

    private func setupSpacing(for model: ListModel, with system: SystemList) {
        mainStackView.spacing = system.margins.horizontalSpacingBetweenItems

        stackViewTopConstraint.constant = system.margins.topMargin
        stackViewBottomConstraint.constant = -system.margins.bottomMargin
        stackViewLeadingConstraint.constant = system.margins.leadingMargin
        stackViewTrailingConstraint.constant = -system.margins.trailingMargin
    }

    private func setupDivider(for model: ListModel) {
        dividerView.isHidden = true
        if model.hasDivider {
            dividerView.isHidden = false
        }
    }

    private func buildListItems() {
        guard let model = viewModel else { return }
        let items = ListComponentModelBuilder.build(for: model, and: action)

        items.forEach {
            switch $0.postion {
            case .left:
                leftComponentView.isHidden = false
                leftComponentModel = $0
            case .right:
                rightComponentView.isHidden = false
                rightComponentModel = $0
            }
        }
    }
}
