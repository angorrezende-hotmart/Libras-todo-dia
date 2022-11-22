//
//  PaginationView.swift
//  HotmartCosmos
//
//  Created by Douglas Seabra Pedrosa on 27/01/22.
//

import UIKit

final class PaginationView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let opacity: CGFloat = 0.5
    }

    // MARK: - View Elements

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.addTarget(self, action: #selector(self.pageControlSelectionAction(_:)), for: .touchUpInside)
        return pageControl
    }()

    // MARK: - Properties

    private var system: SystemPagination?
    private var viewModel: PaginationModel?
    private var action: ((PaginationAction) -> Void)?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let model = viewModel else { return }
        pageControl.pageIndicatorTintColor = model.style == .white ? system?.defaultColor.color.withAlphaComponent(Constants.opacity) : system?.defaultColor.color
        pageControl.currentPageIndicatorTintColor = system?.activeColor.color
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(pageControl)
    }

    override func constrainSubviews() {
        pageControl.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Private Methods

    @objc private func pageControlSelectionAction(_ sender: UIPageControl) {
        let page: Int = sender.currentPage
        action?(.paginationTap(page))
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? PaginationModel else {
            return
        }
        self.viewModel = model
        let system = model.getSystemPagination()
        self.system = system

        pageControl.numberOfPages = model.numberOfPages
        pageControl.currentPage = model.currentPage
    }

    func bindAction(_ externalAction: ((PaginationAction) -> Void)?) {
        action = { switchAction in
            externalAction?(switchAction)
        }
    }
}
