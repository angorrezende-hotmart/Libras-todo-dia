//
//  PillsView.swift
//  HotmartCosmos
//
//  Created by Rafaela Dutra Nunes on 12/08/21.
//

import UIKit

final class PillsView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let heightConstraint: CGFloat = 100
    }

    // MARK: - View Elements

    private lazy var collectionView: DynamicHeightCollectionView = {
        let view = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.registerCell(for: PillsCollectionViewCell.self)
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = false
        view.clipsToBounds = false
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return flowLayout
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Cosmos.typography.bodyStrong.text2Strong.font
        return label
    }()

    private lazy var heightConstraint: NSLayoutConstraint = {
        let anchor = heightAnchor.constraint(equalToConstant: Constants.heightConstraint)
        anchor.priority = .defaultHigh
        return anchor
    }()

    private lazy var titleLabelHeightConstraint: NSLayoutConstraint = {
        let anchor = titleLabel.heightAnchor.constraint(equalToConstant: Spacing().spacing4.value)
        anchor.priority = .defaultHigh
        return anchor
    }()

    private lazy var titleLabelLeadingConstraint: NSLayoutConstraint = {
        let anchor = titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)
        anchor.priority = .defaultHigh
        return anchor
    }()

    // MARK: - Properties

    private var model: PillsModel?
    private var action: ((PillsAction) -> Void)?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(titleLabel)
        addSubview(collectionView)
    }

    override func constrainSubviews() {
        layout(using: [
            heightConstraint,
            titleLabelHeightConstraint,
            titleLabelLeadingConstraint,
        ])

        titleLabel.anchor(
            top: topAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing3.value
        )

        collectionView.anchor(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing2.value
        )
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        collectionView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
    }

    // MARK: - Private Methods

    private func removeSelect() {
        guard let items = model else { return }
        let count = items.items.count
        for i in .zero ..< count {
            model?.items[i].selected = false
        }
    }

    private func select(at indexPath: IndexPath) {
        if let selecteIndexPath = getSelectedIndexPath() {
            if model?.allowMultipleSelection == false {
                model?.items[selecteIndexPath.item].selected = false
            }
            model?.items[indexPath.item].selected.toggle()
            collectionView.reloadDataWithoutScroll()
        } else {
            removeSelect()
            model?.items[indexPath.item].selected = true
            collectionView.reloadData()
        }

        if model?.allowMultipleSelection == true {
            action?(.selectedIndexList(indexes: getAllSelectedIndex()))
        } else {
            action?(.selected(index: indexPath.item))
        }
    }

    private func getSelectedIndexPath() -> IndexPath? {
        guard let model = model else { return nil }
        let count = model.items.count

        for i in .zero ..< count where model.items[i].selected == true {
            return IndexPath(item: i, section: .zero)
        }

        return nil
    }

    private func getAllSelectedIndex() -> [Int] {
        guard let model = model else { return [] }
        let count = model.items.count

        var indexes: [Int] = []

        for index in .zero ..< count where model.items[index].selected == true {
            indexes.append(index)
        }

        return indexes
    }

    // MARK: - Bind

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? PillsModel else {
            return
        }

        self.model = model

        if let title = model.title {
            titleLabel.text = title
            titleLabelHeightConstraint.constant = Spacing().spacing4.value
            titleLabelLeadingConstraint.constant = model.leadingSpacing
        } else {
            titleLabel.text = nil
            titleLabelHeightConstraint.constant = .zero
            titleLabelLeadingConstraint.constant = .zero
        }

        switch model.orientation {
        case .horizontal:
            collectionView.isScrollEnabled = true
            flowLayout.scrollDirection = .horizontal
            heightConstraint.isActive = true

        case .vertical:
            collectionView.isScrollEnabled = false
            flowLayout.scrollDirection = .vertical
            heightConstraint.isActive = false
        }

        collectionView.reloadData()
    }

    func bindAction(_ action: ((PillsAction) -> Void)?) {
        self.action = { buttonAction in
            action?(buttonAction)
        }
    }
}

extension PillsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.items.count ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.reusableCell(for: PillsCollectionViewCell.self, indexPath: indexPath)
        if let model = model?.items[indexPath.item] {
            cell.bindViewModel(model)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PillsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        select(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: .zero,
            left: model?.leadingSpacing ?? .zero,
            bottom: .zero,
            right: Spacing().spacing3.value
        )
    }
}

// Warning: Find a better solution to resolve this later.

private extension UICollectionView {
    func reloadDataWithoutScroll() {
        let offset = contentOffset
        reloadData()
        layoutIfNeeded()
        setContentOffset(offset, animated: false)
    }
}
