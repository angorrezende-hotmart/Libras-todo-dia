//
//  BottomSheetTableViewCell.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

protocol BottomSheetTableViewCellDelegate: AnyObject {
    func bottomSheetTableViewCellDidSelectList(_ model: ListModel)
}

final class BottomSheetTableViewCell: CodedTableViewCell, Bindable {
    // MARK: - Cosmos Components

    private let listComponent: Component<ListModel, ListAction> = Cosmos.makeListView()

    // MARK: - View Elements

    private lazy var listView: UIView = {
        listComponent.onEvent? { [weak self] _ in
            guard let model = self?.viewModel else { return }
            self?.delegate?.bottomSheetTableViewCellDidSelectList(model)
        }

        return listComponent.view()
    }()

    // MARK: - Internal Properties

    weak var delegate: BottomSheetTableViewCellDelegate?

    // MARK: - Private Properties

    private var viewModel: ListModel?

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        backgroundView = nil
    }

    // MARK: - Coded View

    override func addSubviews() {
        selectionStyle = .none
        backgroundColor = .clear
        backgroundView = nil
        selectionStyle = .none
        tintColor = Cosmos.colors.productColors.neutralProductColor.neutral500.color
        contentView.addSubview(listView)
    }

    override func constrainSubviews() {
        listView.fillSuperview()
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? ListModel else {
            preconditionFailure("Failed to parse CosmosModel as BottomSheetListModel")
        }

        self.viewModel = model

        listComponent.update(model)
    }
}
