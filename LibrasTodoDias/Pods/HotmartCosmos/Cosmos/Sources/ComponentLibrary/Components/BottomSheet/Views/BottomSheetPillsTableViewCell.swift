//
//  BottomSheetWithPillsView.swift
//  HotmartCosmos
//
//  Created by Rafaela Dutra Nunes on 15/08/21.
//

import Foundation

protocol BottomSheetPillsTableViewCellDelegate: AnyObject {
    func bottomSheetPillsTableViewCellDelegateDidSelectAt(_ indexPath: IndexPath)
    func bottomSheetPillsTableViewCellDelegateDidSelectAt(_ indexes: [IndexPath])
}

final class BottomSheetPillsTableViewCell: ThemedCodedTableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sideSpacing: CGFloat = 18
        static let topSeparator: CGFloat = 10
    }

    // MARK: - View Elements

    private let pillsComponent: Component<PillsModel, PillsAction> = Cosmos.makePills()

    private lazy var pillsView: UIView = {
        let view = pillsComponent.view()

        return view
    }()

    private let separatorView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: Internal Properties

    weak var delegate: BottomSheetPillsTableViewCellDelegate?
    var viewModel: ViewModel? {
        didSet {
            configureCell()
        }
    }

    // MARK: - Private Properties

    private var indexList: [Int] = []

    // MARK: - Coded View

    override func addSubviews() {
        contentView.addSubview(pillsView)
        contentView.addSubview(separatorView)
    }

    override func constrainSubviews() {
        constrainPillsView()
        constrainSeparatorView()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        separatorView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral200.color
    }

    // MARK: - Constrain Methods

    private func constrainPillsView() {
        pillsView.anchor(
            top: separatorView.bottomAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor,
            bottomConstant: Spacing().spacing6.value
        )
    }

    private func constrainSeparatorView() {
        separatorView.anchor(
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            right: contentView.rightAnchor,
            topConstant: Constants.topSeparator,
            leftConstant: Constants.sideSpacing,
            rightConstant: Constants.sideSpacing,
            heightConstant: .one
        )
    }

    // MARK: - Private Methods

    private func configureCell() {
        guard let viewModel = viewModel else { return }

        selectionStyle = .none

        separatorView.isHidden = viewModel.separatorHidden

        pillsComponent.onEvent? { [weak self] action in
            switch action {
            case let .selected(index):
                self?.delegate?.bottomSheetPillsTableViewCellDelegateDidSelectAt(IndexPath(item: index, section: viewModel.section))
            case let .selectedIndexList(indexes):
                let mappedIndex = indexes.map {
                    IndexPath(item: $0, section: viewModel.section)
                }

                self?.delegate?.bottomSheetPillsTableViewCellDelegateDidSelectAt(mappedIndex)
            }
        }
        pillsComponent.update(viewModel.pillsModel)
    }
}

// MARK: - ViewModel

extension BottomSheetPillsTableViewCell {
    struct ViewModel {
        let pillsModel: PillsModel
        let section: Int
        let separatorHidden: Bool
    }
}
