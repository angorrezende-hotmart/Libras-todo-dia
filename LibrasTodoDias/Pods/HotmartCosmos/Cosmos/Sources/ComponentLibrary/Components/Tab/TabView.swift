//
//  TabView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/06/21.
//

import UIKit

final class TabView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let height: CGFloat = 60.0
        static let spacing: CGFloat = 32.0
        static let leftPadding: CGFloat = 12.0
        static let minimumWidth: CGFloat = 29.0
        static let minimumWidthWithIcon: CGFloat = 53.0
        static let minimumWidthWithIconAndIndicator: CGFloat = 77.0
        static let animationDuration: TimeInterval = 0.20
        static let indicatorHeight: CGFloat = 2.0
        static let indicatorCornerRadius: CGFloat = 8.0
        static let indicatorWidthProportion: CGFloat = 0.80
    }

    // MARK: - View Elements

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = .zero
        flowLayout.minimumLineSpacing = Constants.spacing

        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.registerCell(for: TabItemCollectionViewCell.self)
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = false
        view.clipsToBounds = false
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private let indicatorView: UIView = {
        let view = UIView()
        return view
    }()

    private let divider: Component<DividerModel, Void> = Cosmos.makeDivider()

    private lazy var dividerView: UIView = {
        divider.update(.init(style: .fullBleed, hasVerticalSpacing: false))
        return divider.view()
    }()

    // MARK: - Constraints

    private lazy var indicatorWidth: NSLayoutConstraint = indicatorView.widthAnchor.constraint(equalToConstant: .zero)

    private lazy var indicatorLeading: NSLayoutConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)

    // MARK: - Properties

    private var model: TabModel?
    private var width: CGFloat?
    private var action: ((TabAction) -> Void)?
    private var leftPadding: CGFloat = Constants.leftPadding

    // MARK: - Life Cycle

    override func layoutSubviews() {
        super.layoutSubviews()
        indicatorView.roundCorners(corners: [.topLeft, .topRight], radius: Constants.indicatorCornerRadius)
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        collectionView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color
        indicatorView.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(collectionView)
        addSubview(dividerView)
        addSubview(indicatorView)
    }

    override func constrainSubviews() {
        let heightConstraint = heightAnchor.constraint(equalToConstant: Constants.height)
        heightConstraint.priority = .defaultHigh

        layout(using: [
            heightConstraint,
        ])

        collectionView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )

        indicatorView.anchor(
            bottom: bottomAnchor,
            heightConstant: Constants.indicatorHeight
        )

        indicatorView.layout(using: [
            indicatorLeading,
            indicatorWidth,
        ])

        dividerView.anchor(
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Private Methods

    private func setupIndicatorView() {
        indicatorWidth.constant = widthForCell()
        indicatorLeading.constant = Constants.leftPadding
    }

    private func centerIndicatorView(animated: Bool) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first,
              let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }

        let frame = collectionView.convert(cell.frame, to: self)
        let indicatorLeadingAdjust: CGFloat = model?.widthStyle == .fixed ? 0 : (Constants.spacing / 2)
        let indicatorWidthAdjust = CGFloat(model?.widthStyle == .fixed ? 0 : -Constants.spacing)
        indicatorWidth.constant = frame.width + indicatorWidthAdjust
        indicatorLeading.constant = frame.origin.x + indicatorLeadingAdjust

        if animated {
            UIView.animate(withDuration: Constants.animationDuration) {
                self.layoutSubviews()
            }
        } else {
            layoutSubviews()
        }
    }

    private func widthForCell(indexPath: IndexPath = .init(row: 0, section: 0)) -> CGFloat {
        guard let widthStyle = model?.widthStyle, widthStyle == .adaptable else {
            return fixedWidthForCell()
        }

        return adaptableWidthForCell(indexPath: indexPath)
    }

    private func fixedWidthForCell() -> CGFloat {
        guard let items = model?.items.count else {
            return .zero
        }

        let style: ItemStyle = getItemsStyle()
        let minimumWidth = style.getWidth()

        let calculatedWidth = bounds.width / CGFloat(items) - Constants.spacing
        return calculatedWidth <= minimumWidth ? minimumWidth : calculatedWidth
    }

    private func adaptableWidthForCell(indexPath: IndexPath) -> CGFloat {
        let label = UILabel(frame: CGRect.zero)
        label.font = Cosmos.typography.body.text2.font
        var iconWidth: CGFloat = 0
        if let model = model?.items[indexPath.item] {
            iconWidth = model.icon?.size.width ?? 0
            label.text = model.title
            label.sizeToFit()
        }

        let width = label.frame.width + Constants.spacing + iconWidth
        return width
    }

    private func getItemsStyle() -> ItemStyle {
        if (model?.items.contains { $0.icon != nil } == true) {
            if (model?.items.contains { $0.indicator } == true) {
                return .iconIndicator
            } else {
                return .icon
            }
        } else {
            return .text
        }
    }

    private func shouldAnimate(indexPath: IndexPath) -> Bool {
        guard let items = model?.items.count else {
            return false
        }

        return widthForCell(indexPath: indexPath) * CGFloat(items) > frame.width
    }

    private func getSelectedItemIndexPath(model: TabModel) -> IndexPath {
        guard let index = model.items.firstIndex(where: { $0.selected }) else {
            return .firstIndexPath
        }
        return IndexPath(item: index, section: .zero)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TabModel else {
            return
        }

        self.model = model
        leftPadding = model.widthStyle == .fixed ? Constants.leftPadding : .zero
        collectionView.reloadData()
        collectionView.selectItem(at: getSelectedItemIndexPath(model: model), animated: false, scrollPosition: .left)

        DispatchQueue.main.async { [weak self] in
            self?.centerIndicatorView(animated: false)
        }
    }

    func bindAction(_ action: ((TabAction) -> Void)?) {
        self.action = action
    }

    enum ItemStyle {
        case text
        case icon
        case iconIndicator

        func getWidth() -> CGFloat {
            switch self {
            case .text:
                return Constants.minimumWidth
            case .icon:
                return Constants.minimumWidthWithIcon
            case .iconIndicator:
                return Constants.minimumWidthWithIconAndIndicator
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension TabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.items.count ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.reusableCell(for: TabItemCollectionViewCell.self, indexPath: indexPath)
        if let model = model?.items[indexPath.item] {
            cell.bindViewModel(model)
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.indexPathsForSelectedItems == [.firstIndexPath] {
            setupIndicatorView()
        }
        return CGSize(width: widthForCell(indexPath: indexPath), height: Constants.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        centerIndicatorView(animated: true)
        if shouldAnimate(indexPath: indexPath) {
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }

        action?(.tab(index: indexPath.item, title: model?.items[indexPath.item].title ?? ""))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: .zero, left: leftPadding, bottom: .zero, right: .zero)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        centerIndicatorView(animated: false)
    }
}
