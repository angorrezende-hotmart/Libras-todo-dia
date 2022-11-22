//
//  BottomSheetView.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

protocol BottomSheetViewDelegate: AnyObject {
    func bottomSheetViewDidDismiss()
}

final class BottomSheetView: ThemedCodedView, Bindable {
    enum SectionTypes: Int, CaseIterable {
        case header
        case content
        case pills
        case cardDescription
    }

    // MARK: - Constants

    private enum Constants {
        static let indicatorHeaderHeight: CGFloat = 38.0
        static let indicatorHeight: CGFloat = 6.0
        static let indicatorWidth: CGFloat = 72.0
        static let indicatorCornerRadius: CGFloat = 4.0
        static let backgroundAlpha: CGFloat = 0.6
        static let dismissVelocity: CGFloat = 500.0
        static let dismissTranslation: CGFloat = 100.0
        static let headerHorizontalSpacing: CGFloat = 18.0
        static let headerVerticalSpacing: CGFloat = 20.0
    }

    // MARK: - View Elements

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.alpha = .zero
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOutBottomSheet))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()

    private let sheetView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var indicatorHeaderView: UIView = {
        let view = UIView()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(BottomSheetView.panGestureDidRecognize(_:)))
        panGesture.minimumNumberOfTouches = .one
        panGesture.maximumNumberOfTouches = .one
        view.addGestureRecognizer(panGesture)
        view.isUserInteractionEnabled = true
        return view
    }()

    private let indicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.indicatorCornerRadius
        view.clipsToBounds = true
        return view
    }()

    private let contentStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fill
        }.build()

        return stackView
    }()

    private lazy var tableView: DynamicHeightTableView = {
        let view = DynamicHeightTableView()
        view.registerCell(for: BottomSheetTableViewCell.self)
        view.registerCell(for: BottomSheetHeaderViewCell.self)
        view.registerCell(for: BottomSheetPillsTableViewCell.self)
        view.registerCell(for: BottomSheetCardDescriptionTableViewCell.self)
        view.backgroundView = nil
        view.backgroundColor = .clear
        view.sectionHeaderHeight = .zero
        view.separatorStyle = .none
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private let footerView: BottomSheetFooterView = {
        let view = BottomSheetFooterView()
        return view
    }()

    // MARK: - Internal Properties

    weak var delegate: BottomSheetViewDelegate?

    // MARK: - Private Properties

    private var viewModel: BottomSheetModel?
    private var action: ((BottomSheetAction) -> Void)?
    private var selectedIndex: Int?
    private var selectedIndexList: [Int] = []
    private var selectedIndexPathList: [IndexPath] = []

    private lazy var sheetViewBottomConstraint: NSLayoutConstraint = sheetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero)

    private var keepOpenAfterAction: Bool {
        viewModel?.keepOpenAfterAction ?? false
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.black.color
        sheetView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        indicatorView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
        tableView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
    }

    // MARK: - Coded View

    override func addSubviews() {
        addSubview(backgroundView)
        addSubview(sheetView)

        indicatorHeaderView.addSubview(indicatorView)

        sheetView.addSubview(indicatorHeaderView)
        sheetView.addSubview(contentStackView)
    }

    override func constrainSubviews() {
        constrainBackgroundView()
        constrainSheetView()
        constrainIndicatorHeaderView()
        constrainIndicatorView()
        constrainContentStackView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        sheetView.roundCorners(corners: [.topLeft, .topRight], radius: BorderRadiusGroup().medium.value)
    }

    // MARK: - Constrain Methods

    private func constrainBackgroundView() {
        backgroundView.fillSuperview()
    }

    private func constrainSheetView() {
        sheetView.anchor(
            leading: leadingAnchor,
            trailing: trailingAnchor
        )

        sheetView.layout(using: [
            sheetView.topAnchor.constraint(greaterThanOrEqualTo: safeTopAnchor),
            sheetViewBottomConstraint,
        ])
    }

    private func constrainIndicatorHeaderView() {
        indicatorHeaderView.anchor(
            top: sheetView.topAnchor,
            leading: sheetView.leadingAnchor,
            trailing: sheetView.trailingAnchor,
            heightConstant: Constants.indicatorHeaderHeight
        )
    }

    private func constrainIndicatorView() {
        indicatorView.anchor(
            widthConstant: Constants.indicatorWidth,
            heightConstant: Constants.indicatorHeight
        )

        indicatorView.anchorCenterSuperview()
    }

    private func constrainContentStackView() {
        contentStackView.anchor(
            top: indicatorHeaderView.bottomAnchor,
            leading: sheetView.leadingAnchor,
            bottom: sheetView.bottomAnchor,
            trailing: sheetView.trailingAnchor,
            bottomConstant: Spacing().spacing7.value
        )
    }

    // MARK: - Internal Methods

    func animateBackgroundIn() {
        tableView.reloadData()

        UIView.animation(withDuration: .veryFast) { [weak self] in
            self?.backgroundView.alpha = Constants.backgroundAlpha
        }
    }

    // MARK: - Private Methods

    private func configureHeader(_ model: BottomSheetModel, cell: BottomSheetHeaderViewCell) {
        switch model.header {
        case .none:
            break
        case let .withThumb(image, title, subtitle, description, titleFont):
            configureHeaderView(cell, image: image, title: title, subtitle: subtitle, description: description, style: .centered, titleFont: titleFont)
        case let .normal(title, subtitle, description, titleFont):
            configureHeaderView(cell, title: title, subtitle: subtitle, description: description, style: .centered, titleFont: titleFont)
        case let .leftAligned(title, subtitle, description, titleFont):
            configureHeaderView(cell, title: title, subtitle: subtitle, description: description, style: .leading, titleFont: titleFont)
        }
    }

    @objc private func handleTapOutBottomSheet() {
        animateBackgroundOutAndDismiss()
    }

    private func configureHeaderView(
        _ cell: BottomSheetHeaderViewCell,
        image: UIImage? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        style: BottomSheetHeaderViewModel.Style,
        titleFont: SystemTypography? = nil
    ) {
        let model = BottomSheetHeaderViewModel(
            image: image,
            title: title,
            subtitle: subtitle,
            description: description,
            style: style,
            titleFont: titleFont
        )

        cell.bindViewModel(model)
    }

    private func addDefaultViews() {
        contentStackView.addArrangedSubview(tableView)
        contentStackView.addArrangedSubview(footerView)
    }

    private func configureCustomView(_ view: UIView) {
        contentStackView.addArrangedSubview(view)
    }

    private func configureFooter(_ model: BottomSheetModel) {
        addDefaultViews()
        tableView.reloadData()

        let bottomSheetFooterViewModel: BottomSheetFooterViewModel

        footerView.isHidden = false

        switch model.footer {
        case let .primaryAndSecondary(primaryText, secondaryText):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: primaryText,
                    secondaryButtonText: secondaryText,
                    tertiaryButtonText: nil
                )
            )

        case let .primaryAndTerciary(primaryText, terciaryText):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: primaryText,
                    secondaryButtonText: nil,
                    tertiaryButtonText: terciaryText
                )
            )
        case let .primaryOnly(text):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: text,
                    secondaryButtonText: nil,
                    tertiaryButtonText: nil
                )
            )
        case let .secondaryOnly(text):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: nil,
                    secondaryButtonText: text,
                    tertiaryButtonText: nil
                )
            )
        case let .terciaryOnly(text):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: nil,
                    secondaryButtonText: nil,
                    tertiaryButtonText: text
                )
            )
        case let .custom(firsModel, secondModel, thirdModel):
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .model(
                    firstButtonModel: firsModel,
                    secondButtonModel: secondModel,
                    thirdButtonModel: thirdModel
                )
            )
        case .none:
            bottomSheetFooterViewModel = BottomSheetFooterViewModel(
                style: .text(
                    primaryButtonText: nil,
                    secondaryButtonText: nil,
                    tertiaryButtonText: nil
                )
            )
            footerView.isHidden = true
        }

        footerView.bindViewModel(bottomSheetFooterViewModel)
    }

    private func animateBottomSheetOut() {
        sheetViewBottomConstraint.constant = backgroundView.frame.height

        UIView.animation(
            withDuration: .blink,
            animations: { [weak self] in
                self?.layoutSubviews()
            },
            completion: { [weak self] finished in
                guard finished else { return }
                self?.animateBackgroundOutAndDismiss()
            }
        )
    }

    private func animateBackgroundOutAndDismiss() {
        UIView.animation(
            withDuration: .blink,
            animations: { [weak self] in
                self?.backgroundView.alpha = .zero

            }, completion: { [weak self] finished in
                guard finished else { return }
                self?.delegate?.bottomSheetViewDidDismiss()
            }
        )
    }

    private func getIndexFor(_ model: ListModel) -> Int? {
        let listModels = viewModel?.optionsModel?.listModels

        return listModels?.firstIndex(where: { currenModel in
            currenModel == model
        })
    }

    private func getActionStyleFor(_ model: ListModel) -> ListModel.Style.Action? {
        switch model.style {
        case let .control(actionStyle):
            switch actionStyle {
            case let .actionLeft(action):
                return action
            default:
                break
            }
        default:
            break
        }

        return nil
    }

    private func didSelectModel(_ model: ListModel) {
        guard let index = getIndexFor(model) else {
            return
        }

        if let actionStyle = getActionStyleFor(model) {
            switch actionStyle {
            case .radio:
                selectedIndex = index

                for currentIndex in .zero ..< (viewModel?.optionsModel?.listModels.count ?? .zero) {
                    viewModel?.optionsModel?.listModels[currentIndex].isActive = false
                }

                viewModel?.optionsModel?.listModels[index].isActive = true
            case .checkbox:
                if selectedIndexList.contains(index) {
                    guard let currentIndex = selectedIndexList.firstIndex(of: index) else { return }
                    selectedIndexList.remove(at: currentIndex)
                } else {
                    selectedIndexList.append(index)
                }

                let isActive = !(viewModel?.optionsModel?.listModels[index].isActive ?? false)
                viewModel?.optionsModel?.listModels[index].isActive = isActive
            default:
                break
            }
        } else {
            selectedIndex = index
        }

        tableView.reloadData()

        if let viewModel = viewModel, case .none = viewModel.footer {
            action?(.selected(index: selectedIndex))
            if !keepOpenAfterAction {
                animateBottomSheetOut()
            }
        }
    }

    func didSelectPillsAt(_ indexPath: IndexPath) {
        selectedIndexPathList.removeAll {
            $0.section == indexPath.section
        }

        selectedIndexPathList.append(indexPath)
    }

    func didChangeSelectedPillsTo(_ indexes: [IndexPath]) {
        selectedIndexPathList = indexes
    }

    // MARK: - PanGesture

    @objc
    private func panGestureDidRecognize(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sheetView)
        let velocity = sender.velocity(in: sheetView)

        switch sender.state {
        case .began:
            sheetViewBottomConstraint.constant = .zero
        case .changed:
            if translation.y > .zero {
                sheetViewBottomConstraint.constant = translation.y
            }
        case .ended:
            if velocity.y > Constants.dismissVelocity || translation.y > Constants.dismissTranslation {
                animateBottomSheetOut()
            } else {
                sheetViewBottomConstraint.constant = .zero
            }

        case .cancelled,
             .failed:
            sheetViewBottomConstraint.constant = .zero
        case .possible:
            break
        @unknown default:
            break
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? BottomSheetModel else {
            preconditionFailure("Failed to cast BottomSheetModel")
        }

        self.viewModel = model
        contentStackView.removeSubviews()

        indicatorView.isHidden = model.hideIndicator
        switch model.style {
        case let .custom(view):
            configureCustomView(view)
        default:
            configureFooter(model)
        }
    }

    func bindAction(_ action: ((BottomSheetAction) -> Void)?) {
        self.action = action

        let footerAction: ((BottomSheetFooterViewAction) -> Void)? = { [weak self] footerAction in
            guard let self = self else { return }
            let selectedIndex = self.selectedIndex
            let selectedIndexList = self.selectedIndexList
            let selectedIndexPathList = self.selectedIndexPathList

            switch footerAction {
            case let .primaryButtonTap(text):
                self.action?(.primaryButtonTap(text: text, index: selectedIndex, indexList: selectedIndexList, indexPathList: selectedIndexPathList))
            case let .secondaryButtonTap(text):
                self.action?(.secondaryButtonTap(text: text, index: selectedIndex, indexList: selectedIndexList, indexPathList: selectedIndexPathList))
            case let .tertiaryButtonTap(text):
                self.action?(.tertiaryButtonTap(text: text, index: selectedIndex, indexList: selectedIndexList, indexPathList: selectedIndexPathList))
            case let .customButtonTap(model):
                self.action?(.customButtonTap(buttonModel: model, index: selectedIndex, indexList: selectedIndexList, indexPathList: selectedIndexPathList))
            }

            if !self.keepOpenAfterAction {
                self.animateBottomSheetOut()
            }
        }

        footerView.bindAction(footerAction)
    }
}

// MARK: - UITableViewDataSource

extension BottomSheetView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        SectionTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionTypes(rawValue: section)
        switch sectionType {
        case .header:
            guard let model = viewModel, model.header != .none else { return .zero }
            return .one
        case .content:
            return viewModel?.optionsModel?.listModels.count ?? .zero
        case .pills:
            return viewModel?.optionsModel?.pillsModel.count ?? .zero
        case .cardDescription:
            return viewModel?.optionsModel?.cardsDescriptionModel.count ?? .zero
        default:
            return .zero
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCellFor(indexPath)
        return cell
    }

    private func getCellFor(_ indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionTypes(rawValue: indexPath.section)
        switch sectionType {
        case .header:
            guard let model = viewModel else { return UITableViewCell() }
            let cell: BottomSheetHeaderViewCell = tableView.reusableCell(for: BottomSheetHeaderViewCell.className, for: indexPath)
            configureHeader(model, cell: cell)
            return cell
        case .content:
            let cell: BottomSheetTableViewCell = tableView.reusableCell(for: BottomSheetTableViewCell.className, for: indexPath)
            cell.delegate = self

            if let listModel = viewModel?.optionsModel?.listModels[indexPath.row] {
                cell.bindViewModel(listModel)
            }
            return cell
        case .pills:
            let cell: BottomSheetPillsTableViewCell = tableView.reusableCell(for: BottomSheetPillsTableViewCell.className, for: indexPath)

            if let pillsModel = viewModel?.optionsModel?.pillsModel[indexPath.row] {
                cell.viewModel = .init(
                    pillsModel: pillsModel,
                    section: indexPath.row,
                    separatorHidden: indexPath.row == .zero
                )
            }

            cell.delegate = self
            return cell

        case .cardDescription:
            let cell: BottomSheetCardDescriptionTableViewCell = tableView.reusableCell(for: BottomSheetCardDescriptionTableViewCell.className, for: indexPath)

            if let cardDescriptionModel = viewModel?.optionsModel?.cardsDescriptionModel[indexPath.row] {
                cell.viewModel = .init(
                    cardModel: cardDescriptionModel,
                    section: indexPath.row,
                    separatorHidden: indexPath.row == .zero
                )
            }

            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension BottomSheetView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionTypes(rawValue: section)
        guard let sectionTitle = viewModel?.optionsModel?.sectionTitle, sectionType == .content else {
            return nil
        }

        let section = Cosmos.makeSectionHeader()
        section.update(
            .init(
                title: sectionTitle,
                subtitle: viewModel?.optionsModel?.sectionDescription,
                style: .headerDescription
            )
        )

        let view = UIView()
        view.addSubview(section.view())

        section.view().anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            leadingConstant: Constants.headerHorizontalSpacing,
            bottomConstant: Spacing().spacing3.value,
            trailingConstant: Constants.headerHorizontalSpacing
        )

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = SectionTypes(rawValue: section)
        let haveSectionHeader = viewModel?.optionsModel?.sectionTitle != nil && sectionType == .content
        return haveSectionHeader ? UITableView.automaticDimension : .zero
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let listModels = viewModel?.optionsModel?.listModels,
           listModels.count > indexPath.row {
            let listModel = listModels[indexPath.row]
            didSelectModel(listModel)

        } else if let cardsDescriptionModel = viewModel?.optionsModel?.cardsDescriptionModel,
                  cardsDescriptionModel.count > indexPath.row {
            action?(.selected(index: indexPath.row))
            if !keepOpenAfterAction {
                animateBottomSheetOut()
            }
        }
    }
}

// MARK: - BottomSheetTableViewCellDelegate

extension BottomSheetView: BottomSheetTableViewCellDelegate {
    func bottomSheetTableViewCellDidSelectList(_ model: ListModel) {
        didSelectModel(model)
    }
}

// MARK: - BottomSheetPillsTableViewCellDelegate

extension BottomSheetView: BottomSheetPillsTableViewCellDelegate {
    func bottomSheetPillsTableViewCellDelegateDidSelectAt(_ indexPath: IndexPath) {
        didSelectPillsAt(indexPath)
    }

    func bottomSheetPillsTableViewCellDelegateDidSelectAt(_ indexes: [IndexPath]) {
        didChangeSelectedPillsTo(indexes)
    }
}
