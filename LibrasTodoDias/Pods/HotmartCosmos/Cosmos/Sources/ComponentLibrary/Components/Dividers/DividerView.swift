//
//  DividerView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 28/05/21.
//

import Foundation

final class DividerView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private let lineView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Constraints

    private lazy var topConstraint: NSLayoutConstraint = lineView.topAnchor.constraint(equalTo: topAnchor, constant: .zero)

    private lazy var leadingConstraint: NSLayoutConstraint = lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)

    private lazy var bottomConstraint: NSLayoutConstraint = lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero)

    private lazy var trailingConstraint: NSLayoutConstraint = lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero)

    private lazy var heightConstraint: NSLayoutConstraint = lineView.heightAnchor.constraint(equalToConstant: .ulpOfOne)

    // MARK: - Properties

    private var system: SystemDivider?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(lineView)
    }

    override func constrainSubviews() {
        lineView.layout(using: [
            topConstraint,
            leadingConstraint,
            bottomConstraint,
            trailingConstraint,
            heightConstraint,
        ])
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        lineView.backgroundColor = system?.color
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? DividerModel else {
            return
        }

        let system = model.style.getSystem()
        self.system = system
        topConstraint.constant = model.hasVerticalSpacing ? system.verticalSpacing : .zero
        leadingConstraint.constant = system.horizontalSpacing
        bottomConstraint.constant = model.hasVerticalSpacing ? -system.verticalSpacing : .zero
        trailingConstraint.constant = -system.horizontalSpacing
        heightConstraint.constant = system.lineHeight
        lineView.backgroundColor = system.color
    }
}
